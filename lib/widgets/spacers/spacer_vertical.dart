import 'package:flutter/material.dart';

class SpacerVertical extends StatelessWidget {
  const SpacerVertical(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
