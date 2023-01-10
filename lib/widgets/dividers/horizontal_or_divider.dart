import 'package:flutter/material.dart';

class HorizontalOrDivider extends StatelessWidget {
  const HorizontalOrDivider(
      {this.label = "ou", this.height = 1, this.color = Colors.black, this.spacing = 15.0});

  final String label;
  final double height;
  final Color color;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 10.0, right: spacing),
            child: Container(
              color: color,
              height: height,
            )),
      ),
      Text(label, style: TextStyle(color: color)),
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: spacing, right: 10.0),
            child: Container(
              color: color,
              height: height,
            )),
      ),
    ]);
  }
}
