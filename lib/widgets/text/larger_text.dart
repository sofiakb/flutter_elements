import 'package:flutter/material.dart';

import 'large_text.dart';

class LargerText extends StatelessWidget {
  const LargerText(this.text, {Key? key, this.fontSize, this.style, this.overflow, this.textAlign})
      : super(key: key);

  final String text;
  final double? fontSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return LargeText(
      text,
      overflow: overflow,
      style: style,
      textAlign: textAlign,
      fontSize:
          fontSize ?? (Theme.of(context).textTheme.bodyLarge!.fontSize! * 1.3),
    );
  }
}
