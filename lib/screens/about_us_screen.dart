import 'package:flutter/material.dart';

import '../widgets/about_us_content.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about-us-screen';

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
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenSize.height/2),
              height: screenSize.height / 3,
              width: screenSize.width,
              child: AboutUsContent(),
            ),
            Container(
              width: screenSize.width,
              margin: EdgeInsets.only(top: screenSize.height),
              child: BottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}
