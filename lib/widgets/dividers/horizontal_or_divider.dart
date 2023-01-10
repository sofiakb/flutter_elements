import 'package:flutter/material.dart';

class HorizontalOrDivider extends StatelessWidget {
  const HorizontalOrDivider(
      {this.label = "ou", this.height = 1, this.color = Colors.black});

  final String label;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: color,
              height: height,
            )),
      ),
      Text(label, style: TextStyle(color: color)),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: color,
              height: height,
            )),
      ),
    ]);
  }
}
