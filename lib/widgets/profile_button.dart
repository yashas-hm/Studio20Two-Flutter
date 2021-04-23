import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height/30,
      width: screenSize.width/10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenSize.aspectRatio*6,
            backgroundColor: Colors.black54,
            backgroundImage: AssetImage('assets/images/music.jpg'),
          ),
          SizedBox(
            width: screenSize.aspectRatio*8,
          ),
          Text(
            "Test",
            style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.aspectRatio*8,
                fontFamily: 'MonumentExtended',
                fontStyle: FontStyle.normal),
          ),
        ],
      ),
    );
  }

}