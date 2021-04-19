import 'package:flutter/material.dart';

class OptionSelector extends StatefulWidget {
  final text;
  final fontSize;
  final textColor;
  final Function function;

  OptionSelector(
    this.text,
    this.function, [
    this.fontSize = 20,
    this.textColor = Colors.white,
  ]);

  @override
  _OptionSelectorState createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.function();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize,
              fontFamily: 'MonumentExtended',
              fontStyle: FontStyle.normal
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Visibility(
            visible: _isHovering,
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            child: Container(
              height: 3,
              width: MediaQuery.of(context).size.width / 20,
              decoration: BoxDecoration(
                color: widget.textColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
      hoverColor: Colors.transparent,
      onHover: (value) => setState(() {
        _isHovering = value;
      }),
    );
  }
}
