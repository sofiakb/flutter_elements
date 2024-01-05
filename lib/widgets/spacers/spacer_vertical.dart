import 'package:flutter/material.dart';

class SpacerVertical extends StatelessWidget {
  const SpacerVertical(this.size, {super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
