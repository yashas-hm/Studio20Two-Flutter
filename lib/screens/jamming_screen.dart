import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/cost_distribution.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';

class JammingScreen extends StatelessWidget {
  static const routeName = '/jamming-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().createAppBar(context),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CreateBackground(),
            CreateLogo(),
            CostDistribution(
              size: 3,
              text: [
                'Category',
                'Jam Room',
                'Karaoke',
              ],
              cost: [
                'Per Hour',
                '1000',
                '1000',
              ],
              functions: [
                () {},
                () {},
              ],
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
