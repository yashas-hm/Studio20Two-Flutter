import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/auth_card.dart';
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
              child: AuthCard(),
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
