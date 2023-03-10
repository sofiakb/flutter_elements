import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  const LargeText(this.text,
      {Key? key, this.fontSize, this.style, this.overflow, this.textAlign})
      : super(key: key);

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
      style: (style ?? TextStyle()).copyWith(
          fontSize: fontSize ??
              (Theme.of(context).textTheme.bodyText1!.fontSize! * 1.1)),
    );
  }
}
