import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';

class ContactUsScreen extends StatelessWidget {
  static const routeName = '/contact-us-screen';

  Widget _getContact(
      BuildContext context, Size screenSize, String element, String url) {
    return InkWell(
      child: Image.asset(
        element,
        height: screenSize.height / 9,
        width: screenSize.height / 9,
        fit: BoxFit.cover,
      ),
      onTap: () => BottomBar().openUrl(context, url),
    );
  }

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
            Container(
              width: screenSize.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: screenSize.height / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(screenSize.aspectRatio * 18),
                ),
                child: Container(
                  width: screenSize.width / 3.5,
                  height: screenSize.height / 2.5,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _getContact(
                        context,
                        screenSize,
                        'assets/images/instagram.png',
                        'https://www.instagram.com/studio20two/',
                      ),
                      _getContact(
                        context,
                        screenSize,
                        'assets/images/gmail.png',
                        'mailto:mystudio20two@gmail.com',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height / 6,
              margin: EdgeInsets.only(top: screenSize.height),
              child: BottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}
