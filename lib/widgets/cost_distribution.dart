import 'package:flutter/material.dart';

class CostDistribution extends StatelessWidget {
  final int size;
  final List<String> text;
  final List<String> cost;
  final List<Function> functions;

  CostDistribution({this.size, this.text, this.cost, this.functions});

  Widget _createTable(Size screenSize, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _createText(text, screenSize),
        ),
        SizedBox(
          width: screenSize.aspectRatio*12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _createText(cost, screenSize),
        ),
        SizedBox(
          width: screenSize.aspectRatio*12,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _createButtons(screenSize, context),
          ),
        ),
      ],
    );
  }

  List<Widget> _createButtons(Size screenSize, BuildContext context) {
    List<Widget> widgets = [];
    widgets.add(
      SizedBox(
        height: screenSize.aspectRatio * 23,
      ),
    );

    for (int i = 0; i < size - 1; i++) {
      widgets.add(
        SizedBox(
          height: screenSize.aspectRatio * 15,
        ),
      );
      widgets.add(Container(
        width: screenSize.aspectRatio * 50,
        height: screenSize.aspectRatio * 20,
        child: ElevatedButton(
          onPressed: () => functions[i](),
          child: Text(
            'Book Now',
            style: TextStyle(
              fontSize: screenSize.aspectRatio*5,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColorDark),
        ),
      ));
    }

    return widgets;
  }

  List<Widget> _createText(final List<String> data, Size screenSize) {
    List<Widget> widgets = [];

    widgets.add(
      Text(
        data[0],
        style: TextStyle(
          fontSize: screenSize.aspectRatio * 15,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    for (int i = 1; i < size; i++) {
      widgets.add(
        SizedBox(
          height: screenSize.aspectRatio * 15,
        ),
      );

      widgets.add(
        Text(
          data[i],
          style: TextStyle(
            fontSize: screenSize.aspectRatio * 12,
            fontFamily: 'Montserrat',
            fontStyle: FontStyle.normal,
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: screenSize.height / 2.2),
      width: screenSize.width,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(screenSize.aspectRatio * 12),
        ),
        child: Container(
          padding: EdgeInsets.all(screenSize.aspectRatio * 10),
          color: Colors.white,
          width: screenSize.width / 2.4,
          height: screenSize.height / 2,
          child: _createTable(screenSize, context),
        ),
      ),
    );
  }
}
