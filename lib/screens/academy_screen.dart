import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/cost_distribution.dart';

class AcademyScreen extends StatelessWidget {
  static const routeName = '/academy-screen';

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
            CostDistribution(
              size: 4,
              text: [
                'Course',
                'Guitar',
                'Keyboard',
                'Vocals',
              ],
              cost: [
                'Per Month',
                '4000',
                '4000',
                '4000',
              ],
              functions: [
                () {},
                () {},
                () {},
              ],
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
