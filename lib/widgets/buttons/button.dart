import 'package:flutter/material.dart';
import 'package:sofiakb_elements/style.dart';

class Button extends StatelessWidget {
  const Button(this.text,
      {Key? key,
      required this.onPressed,
      this.style,
      this.loading = false,
      this.disabled = false,
      this.loader,
      this.backgroundColor,
      this.foregroundColor, this.padding})
      : super(key: key);

  final void Function() onPressed;
  final ButtonStyle? style;
  final String text;
  final bool loading;
  final bool disabled;
  final Color? backgroundColor;
  final Color? foregroundColor;

  final Widget? loader;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: (style ?? ButtonStyle()).copyWith(
        backgroundColor: disabled
            ? null
            : MaterialStateProperty.all<Color>((backgroundColor ??
                style?.backgroundColor ??
                AppStyle.instance.primaryColor) as Color),
        foregroundColor: disabled
            ? null
            : MaterialStateProperty.all<Color>((foregroundColor ??
                style?.foregroundColor ??
                Colors.white) as Color) as MaterialStatePropertyAll<Color?>,
      ),
      child: Padding(
        padding: padding ?? AppStyle.paddingSymmetric(vertical: 1, horizontal: 2),
        child: loading
            ? SizedBox(
                height: 10,
                width: 10,
                child: Center(
                    child: loader ??
                        CircularProgressIndicator(
                          color:
                              (style?.foregroundColor ?? Colors.white) as Color,
                        )))
            : Text(text),
      ),
    );
  }
}
