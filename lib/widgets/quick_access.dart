import 'package:flutter/material.dart';
import 'package:studio20two/widgets/quick_access_text.dart';

class QuickAccess extends StatelessWidget {
  final screenSize;

  QuickAccess(this.screenSize);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.44,
          left: screenSize.width / 4,
          right: screenSize.width / 4,
        ),
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(screenSize.aspectRatio*3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QuickAccessText('Academy', screenSize),
                SizedBox(
                  height: screenSize.height / 20,
                  child: VerticalDivider(
                    width: screenSize.aspectRatio*6,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                QuickAccessText('Jamming', screenSize),
                SizedBox(
                  height: screenSize.height / 20,
                  child: VerticalDivider(
                    width: screenSize.aspectRatio*6,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                QuickAccessText('Recording', screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
