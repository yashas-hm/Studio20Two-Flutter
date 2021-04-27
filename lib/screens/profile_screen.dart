import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

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
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
