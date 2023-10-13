import 'package:flutter/material.dart';

class CustomGridColumn extends StatelessWidget {
  const CustomGridColumn(
      {super.key,
        required this.child,
        this.withPadding = true,
        this.padding,
        this.size});

  final Widget child;
  final bool withPadding;
  final EdgeInsetsGeometry? padding;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: withPadding ? padding ?? const EdgeInsets.only(left: 10.0, right: 10.0) : EdgeInsets.zero,
        child: child);
  }
}