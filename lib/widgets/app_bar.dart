import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './option_selector.dart';
import './profile_button.dart';
import '../providers/auth.dart';
import '../screens/auth_screen.dart';
import '../screens/contact_us_screen.dart';
import '../screens/home_screen.dart';

class CustomAppBar {
  PreferredSizeWidget createAppBar(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(screenSize.aspectRatio * 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OptionSelector(
                'Studio20Two',
                () => Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName),
                screenSize.aspectRatio * 8 + 5,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionSelector(
                      'Contact Us',
                      () => Navigator.of(context)
                          .pushNamed(ContactUsScreen.routeName),
                      screenSize.aspectRatio * 8,
                    ),
                    SizedBox(
                      width: screenSize.width / 50,
                    ),
                    OptionSelector(
                      'Book Now',
                      () {},
                      screenSize.aspectRatio * 8,
                    ),
                  ],
                ),
              ),
              Consumer<Auth>(
                builder: (ctx, auth, child) {
                  auth.tryAutoLogin();
                  return auth.isAuth
                      ? AppBarProfile(auth)
                      : OptionSelector(
                          'Login/Signup',
                          () => Navigator.of(context)
                              .pushNamed(AuthScreen.routeName),
                          screenSize.aspectRatio * 8,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarProfile extends StatelessWidget {

  final Auth auth;
  AppBarProfile(this.auth);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return PopupMenuButton(
        itemBuilder: (ctx) => [
          PopupMenuItem(
              child: OptionSelector(
            'Profile',
            () {},
            screenSize.aspectRatio * 5,
            Colors.black,
          )),
          PopupMenuItem(
              child: OptionSelector(
            'Recordings',
            () {},
            screenSize.aspectRatio * 5,
            Colors.black,
          )),
          PopupMenuItem(
              child: OptionSelector(
            'Logout',
            () {
              auth.logout();
              Navigator.of(ctx).pop();
            },
            screenSize.aspectRatio * 5,
            Colors.black,
          )),
        ],
        child: ProfileButton(),
        offset: Offset(
          -screenSize.aspectRatio * 8,
          screenSize.aspectRatio * 20,
        ),
      );
  }
}
