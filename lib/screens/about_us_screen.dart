import 'package:flutter/material.dart';

import '../widgets/about_us_content.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';

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
            CreateBackground(),
            CreateLogo(),
            Container(
              margin: EdgeInsets.only(top: screenSize.height / 2),
              height: screenSize.height / 3,
              width: screenSize.width,
              child: AboutUsContent(),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
