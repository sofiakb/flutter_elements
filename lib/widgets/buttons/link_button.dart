import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sofiakb_elements/style.dart';

class LinkButton extends StatelessWidget {
  const LinkButton(this.text, {Key? key, this.style, this.color, required this.onTap})
      : super(key: key);

  final String text;
  final Color? color;
  final TextStyle? style;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: text,
      style: style ??
          TextStyle(
              color: color ?? AppStyle.secondaryColor,
              fontWeight: FontWeight.bold),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    ));
  }
}
