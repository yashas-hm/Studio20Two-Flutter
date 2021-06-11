import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';

class BookScreen extends StatelessWidget {
  static const routeName = '/book-screen';

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
            CreateBackground(),
            CreateLogo(),
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
                      Text('DM on instagram'),
                      _getContact(
                        context,
                        screenSize,
                        'assets/images/instagram.png',
                        'https://www.instagram.com/studio20two/',
                      ),
                      Text('Mail us'),
                      _getContact(
                        context,
                        screenSize,
                        'assets/images/gmail.png',
                        'mailto:mystudio20two@gmail.com',
                      ),
                      Text('OR\n\nContact at: 9979004650', textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width,
              height: screenSize.height/10,
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
