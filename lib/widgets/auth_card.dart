import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../utils/HTTPException.dart';

enum AuthMode { Signup, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );
        Navigator.of(context).pushReplacementNamed("/");
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['email'],
          _authData['password'],
        );
        Navigator.of(context).pushReplacementNamed("/");
      }
    } on HTTPException catch (error) {
      var msg = 'Authentication Failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        msg = 'Please login email exists';
      } else if (error.toString().contains('TOO_MANY_ATTEMPTS_TRY_LATER')) {
        msg = 'Too many attempts try again later';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        msg = 'Invalid Password';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        msg = 'Invalid Email. PLease sign up.';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        msg = 'Password too weak enter more than 6 characters';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (error) {
      var message = 'Some error occurred. Try again';
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenSize.aspectRatio * 12),
      ),
      elevation: 8.0,
      child: AnimatedContainer(
        height: _authMode == AuthMode.Signup
            ? screenSize.height / 2.5
            : screenSize.height / 2.5 - 40,
        constraints: BoxConstraints(
            minHeight: _authMode == AuthMode.Signup
                ? screenSize.height / 2.5
                : screenSize.height / 2.5 - 40),
        width: screenSize.width / 4,
        padding: EdgeInsets.all(16.0),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value;
                  },
                ),
                SizedBox(
                  height: screenSize.aspectRatio * 5,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                SizedBox(
                  height: screenSize.aspectRatio * 10,
                ),
                AnimatedContainer(
                  constraints: BoxConstraints(
                    maxHeight: _authMode == AuthMode.Signup
                        ? screenSize.height / 20
                        : 0,
                    minHeight: _authMode == AuthMode.Signup
                        ? screenSize.height / 20
                        : 0,
                  ),
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 300),
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: TextFormField(
                        enabled: _authMode == AuthMode.Signup,
                        decoration:
                        InputDecoration(labelText: 'Confirm Password'),
                        obscureText: true,
                        validator: _authMode == AuthMode.Signup
                            ? (value) {
                          if (value != _passwordController.text) {
                            return 'Passwords do not match!';
                          }
                          return null;
                        }
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.aspectRatio * 10,
                ),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: _submit,
                    child:
                    Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              screenSize.aspectRatio * 30)),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.aspectRatio * 15,
                        vertical: screenSize.aspectRatio * 11,
                      ),
                      textStyle: TextStyle(color: Colors.white),
                      primary: Theme.of(context).primaryColorDark,
                    ),
                  ),
                TextButton(
                  onPressed: _switchAuthMode,
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'New User? SignUp' : 'Existing User? Login'} instead'),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.aspectRatio * 15,
                        vertical: screenSize.aspectRatio * 11,
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Theme.of(context).primaryColorDark),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
