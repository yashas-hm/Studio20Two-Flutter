import 'package:flutter/material.dart';

class QuickAccessText extends StatefulWidget{

  final text;
  final textColor;
  final Size screenSize;
  final Function function;

  QuickAccessText(this.text, this.screenSize, this.function,[
    this.textColor = Colors.black,
  ]);

  @override
  _QuickAccessTextState createState() => _QuickAccessTextState();
}

class _QuickAccessTextState extends State<QuickAccessText> with SingleTickerProviderStateMixin {

  var _isHovering = false;
  AnimationController _controller;
  Animation<double> _zoom;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _zoom = Tween<double>(begin: widget.screenSize.aspectRatio*8, end: widget.screenSize.aspectRatio*8 + 5)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _zoom.addListener(() =>setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () => widget.function(),
      onHover: (value)  {
        setState(() {
          _isHovering = value;
        });

        if(_isHovering){
          _controller.forward();
        }else{
          _controller.reverse();
        }

      },
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor,
          fontSize: _zoom.value,
          fontFamily: 'Montserrat',
          fontStyle: FontStyle.normal
        ),
      ),
    );
  }
}