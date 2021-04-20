import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/cost_distribution.dart';
import '../widgets/create_background.dart';
import '../widgets/create_logo.dart';

class AcademyScreen extends StatelessWidget {
  static const routeName = '/academy-screen';

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
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
