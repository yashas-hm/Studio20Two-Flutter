import 'package:flutter/material.dart';

class CreateLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 50),
      height: screenSize.height * 0.45,
      width: screenSize.width,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(
          'assets/images/logo.jpg',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
