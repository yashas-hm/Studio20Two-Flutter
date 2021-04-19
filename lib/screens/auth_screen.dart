import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {

  static const routeName = '/auth-screen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height + 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).backgroundColor,
                  Theme.of(context).primaryColorLight
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: screenSize.height/50),
            width: screenSize.width,
            height: screenSize.height/3.5,
            child: Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Card(
              elevation: 10,
              child: Text('wodfj') ,
            ),
          )
        ],
      ),
    );
  }
}
