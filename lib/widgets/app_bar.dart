import 'package:flutter/material.dart';
import 'package:studio20two/screens/home_screen.dart';

import './option_selector.dart';
import '../screens/auth_screen.dart';

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
                      () {},
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
              OptionSelector(
                'Login/Signup',
                () => Navigator.of(context).pushNamed(AuthScreen.routeName),
                screenSize.aspectRatio * 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
