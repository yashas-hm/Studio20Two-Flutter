import 'package:flutter/material.dart';
import '../widgets/carousel.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/quick_access.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return InteractiveViewer(
      child: Scaffold(
        appBar: CustomAppBar().createAppBar(context),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CreateBackground(),
              CreateLogo(),
              QuickAccess(screenSize),
              Container(
                margin: EdgeInsets.only(top: screenSize.height / 1.7),
                width: screenSize.width,
                height: screenSize.height / 3,
                alignment: Alignment.center,
                child: Carousel(
                  [
                    'assets/images/1.jpg',
                    'assets/images/2.jpg',
                    'assets/images/3.jpg',
                    'assets/images/5.jpg',
                  ],
                ),
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
