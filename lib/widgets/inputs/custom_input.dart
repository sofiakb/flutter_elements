library sofiakb_elements;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sofiakb_elements/core/validators/validator.dart';

class CustomInput extends StatefulWidget {
  const CustomInput(
      {super.key,
      this.title,
      this.hintText,
      this.controller,
      this.isObscure = false,
      this.enabled,
      this.required = false,
      this.errorMessage,
      this.isFocus = false,
      this.labelIcon,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.validatorMessage,
      this.onChanged,
      this.textInputType,
      this.textInputAction,
      this.autocorrect = true,
      this.child,
      this.resize = false,
      this.minLines = 1,
      this.inputFormatters});

  final String? hintText;
  final String? title;
  final bool? enabled;
  final bool isFocus;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  final bool autocorrect;

  final TextEditingController? controller;
  final bool isObscure;
  final bool required;

  final String? errorMessage;

  final IconData? labelIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? Function(String? value)? validator;
  final String? validatorMessage;

  final Function(String)? onChanged;

  final List<TextInputFormatter>? inputFormatters;

  final Widget? child;

  final bool resize;

  final int minLines;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String? errorMessage;

  @override
  void initState() {
    errorMessage = widget.errorMessage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 8.0, bottom: hasErrorMessage() ? 20.0 : 8.0),
      child: widget.resize
          ? LayoutBuilder(builder: (context, size) {
              TextSpan text = TextSpan(
                text: widget.controller?.text,
              );

              TextPainter tp = TextPainter(
                text: text,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
              );
              tp.layout(maxWidth: size.maxWidth);

              int lines = (tp.size.height / tp.preferredLineHeight).ceil();
              int maxLines = 10;

              return _widget(maxLines: lines < maxLines ? null : maxLines);
            })
          : widget.child ?? _widget(),
    );
  }

  Widget _widget({int? maxLines}) => TextFormField(
        onChanged: widget.onChanged,
        autocorrect: widget.autocorrect,
        decoration: InputDecoration(
          label: widget.title != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.labelIcon != null)
                        FaIcon(
                          widget.labelIcon!,
                          size: 13.0,
                        ),
                      if (widget.labelIcon != null)
                        const SizedBox(
                          width: 8.0,
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title!,
                          ),
                          if (widget.required == true)
                            const Text(
                              '*',
                              style: TextStyle(color: Colors.red, fontSize: 8),
                            ),
                        ],
                      ),
                      // Text("${widget.title}${widget.required == true ? '*' : ''}"),
                    ],
                  ),
                )
              : null,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon == null
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.prefixIcon!,
                  ],
                ),
          suffixIcon: widget.suffixIcon == null
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.suffixIcon!,
                  ],
                ),
        ),
        autofocus: widget.isFocus,
        enabled: widget.enabled,
        controller: widget.controller,
        obscureText: widget.isObscure,
        textInputAction: widget.textInputAction,
        inputFormatters: widget.inputFormatters,
        maxLines: maxLines,
        minLines: widget.minLines,
        validator: (String? value) {
          return updateErrorMessage(widget.validator != null
              ? widget.validator!(value)
              : (value == null || value.isEmpty
                  ? widget.validatorMessage ??
                      Validator().errorMessage(message: "ce champ")
                  : null));
        },
        keyboardType: widget.textInputType ?? TextInputType.text,
      );

  bool hasErrorMessage() {
    return widget.errorMessage != null &&
        widget.errorMessage!.isNotEmpty == true;
  }

  String? updateErrorMessage(String? message) {
    setState(() => errorMessage = message);
    return errorMessage;
  }
}
