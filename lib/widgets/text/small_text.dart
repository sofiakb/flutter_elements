import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText(this.text, {super.key, this.fontSize, this.style, this.overflow, this.textAlign});

  final String text;
  final double? fontSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: (style ?? const TextStyle()).copyWith(
          fontSize: fontSize ??
              (Theme.of(context).textTheme.bodyLarge!.fontSize! * 0.8)),
    );
  }
}
