import 'package:flutter/material.dart';

import 'custom_grid_column.dart';

class CustomGridRow extends StatelessWidget {
  const CustomGridRow({super.key,   required this.children});

  final List<CustomGridColumn> children;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: children.map((e) => FractionallySizedBox(
        widthFactor: e.size == null ? 1 / children.length : (12 / e.size!),
        child: e,
      )).toList(),
    );
  }
}