import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  final int size;
  final List<String> textData;
  final List<Function> functions;

  BottomBarColumn({this.size, this.textData, this.functions});

  List<Widget> createWidgets(BuildContext context) {
    List<Widget> widgets = [];

    final screenSize = MediaQuery.of(context).size;

    widgets.add(
      Text(
        textData[0],
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: screenSize.aspectRatio*10,
          fontWeight: FontWeight.bold
        ),
      ),
    );
    for (int i = 1; i < size; i++) {
      widgets.add(
        SizedBox(
          height: 10,
        ),
      );
      widgets.add(
        InkWell(
          child: Text(
            textData[i],
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.aspectRatio*8,
            ),
          ),
          hoverColor: Colors.transparent,
          onTap: ()=>functions[i-1](),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: createWidgets(context),
      ),
    );
  }
}
