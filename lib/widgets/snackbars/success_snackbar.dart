import 'package:flutter/material.dart';
import 'package:sofiakb_elements/widgets/snackbars/custom_snackbar.dart';

class SuccessSnackbar extends CustomSnackbar {
  const SuccessSnackbar(
      {Key? key,
      this.content,
      this.backgroundColor = Colors.green,
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
