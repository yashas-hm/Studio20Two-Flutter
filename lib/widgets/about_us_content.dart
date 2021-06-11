import 'package:flutter/material.dart';

class AboutUsContent extends StatelessWidget {
  final content = [
    'We provide jam room for jamming sessions, training for keyboard, Guitar and Vocals and we also provide a studio for recording songs ',
    '“Music drives you. It wakes you up, it gets you pumping. And, at the end of the day, the correct tune will chill you down.” – Dimebag Darrell',
    'We’re proud of the reputation that Studio20Two has gained throughout the years. What started off as a record label is now a recording studio, music academy and karaoke bar. A place where students, instructors and artists can thrive and make the most of their talents.',
  ];
  final heading = ['Services', 'Message', 'History'];

  List<Widget> createWidgets(Size screenSize) {
    final List<Widget> widgets = [];
    for (int i = 0; i < 3; i++) {
      widgets.add(
        Container(
          height: screenSize.height / 4,
          width: screenSize.width / 5,
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  heading[i],
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: screenSize.aspectRatio * 11,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenSize.aspectRatio*10,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: screenSize.width / 3.5,
                    height: screenSize.height / 6,
                    padding: EdgeInsets.all(screenSize.aspectRatio*5),
                    child: Text(
                      content[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: screenSize.aspectRatio * 8,
                          fontFamily: 'Montserrat',
                          fontStyle: FontStyle.normal),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: createWidgets(screenSize),
    );
  }
}
