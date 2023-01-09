import 'package:flutter/material.dart';

class SpacerHorizontal extends StatelessWidget {
  const SpacerHorizontal(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}
