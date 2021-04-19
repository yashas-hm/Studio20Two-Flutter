import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/cost_distribution.dart';

class RecordingScreen extends StatelessWidget {
  static const routeName = '/recording-screen';

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
              size: 3,
              text: [
                'Recording',
                'Jamming',
                'Karaoke',
              ],
              cost: [
                'Per Hour',
                '1500',
                '1500',
              ],
              functions: [
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
