import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';
import '../widgets/quick_access.dart';

class BookNowScreen extends StatelessWidget {
  static const routeName = '/book-now-screen';

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
            QuickAccess(screenSize),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
