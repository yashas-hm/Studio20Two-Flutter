import 'package:flutter/material.dart';
import 'package:studio20two/widgets/carousel.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/quick_access.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar().createAppBar(context),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
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
              padding: EdgeInsets.fromLTRB(0, 80, 0, 50),
              height: screenSize.height * 0.45,
              width: screenSize.width,
              child: Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.contain,
              ),
            ),
            QuickAccess(screenSize),
            Container(
              margin: EdgeInsets.only(top: screenSize.height/1.7),
              width: screenSize.width,
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                height: screenSize.height / 3,
                width: screenSize.width/3,
                child: Carousel(),
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height/6,
              margin: EdgeInsets.only(top: screenSize.height),
              child: BottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}
