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

  @override
  final Widget? content;
  @override
  final String? text;
  @override
  final Color? backgroundColor;
  @override
  final SnackBarBehavior? behavior;
  @override
  final EdgeInsets? margin;
  @override
  final double? elevation;

  @override
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
