import 'package:flutter/material.dart';

class CustomSnackbar {
  const CustomSnackbar(
      {Key? key,
      this.content,
      this.backgroundColor,
      this.behavior,
      this.margin,
      this.elevation,
      this.text});

  final Widget? content;
  final String? text;
  final Color? backgroundColor;
  final SnackBarBehavior? behavior;
  final EdgeInsets? margin;
  final double? elevation;

  void show(context) {
    final snackBar = SnackBar(
      content: content ?? Text(text!),
      backgroundColor: backgroundColor,
      behavior: behavior ?? SnackBarBehavior.floating,
      margin: margin,
      elevation: elevation,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
