import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth-screen';

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
              margin: EdgeInsets.only(top: screenSize.height / 2.2),
              width: screenSize.width,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(screenSize.aspectRatio * 12),
                ),
                child: Container(
                  padding: EdgeInsets.all(screenSize.aspectRatio * 10),
                  color: Colors.white,
                  width: screenSize.width / 2.4,
                  height: screenSize.height / 2.1,
                  child: Center(
                    child: Text('hello'),
                  ),
                ),
              ),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
