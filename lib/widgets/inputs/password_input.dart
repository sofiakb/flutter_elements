library sofiakb_elements;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sofiakb_elements/core/validators/password_validator.dart';

import 'custom_input.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({
    Key? key,
    this.title,
    this.hintText,
    this.controller,
    this.isObscure = true,
    this.enabled,
    this.errorMessage,
    this.isFocus = false,
    this.required = false,
    this.validator,
    this.validatorMessage,
    this.withIcon = false,
    this.onChanged,
    this.autocorrect = false,
    this.verifyFormat = true,
    this.labelIcon
  }) : super(key: key);

  final String? hintText;
  final String? title;
  final bool? enabled;
  final bool isFocus;
  final bool required;

  final TextEditingController? controller;
  final bool isObscure;

  final String? errorMessage;

  final bool? withIcon;

  final String? Function(String? value)? validator;
  final String? validatorMessage;

  final Function(String)? onChanged;

  final bool autocorrect;

  final bool verifyFormat;

  final IconData? labelIcon;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  String? errorMessage;

  bool hidden = true;

  @override
  void initState() {
    errorMessage = widget.errorMessage;
    hidden = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      title: widget.title ?? "Mot de passe",
      hintText: widget.hintText ?? "Mot de passe",
      controller: widget.controller,
      isObscure: hidden,
      isFocus: widget.isFocus,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      autocorrect: widget.autocorrect,
      errorMessage: widget.errorMessage,
      labelIcon:
          widget.withIcon == true ? widget.labelIcon ?? FontAwesomeIcons.lightLockKeyhole : null,
      required: widget.required,
      suffixIcon: IconButton(
        icon: FaIcon(hidden
            ? FontAwesomeIcons.lightEye
            : FontAwesomeIcons.lightEyeSlash),
        onPressed: () => setState(() => hidden = !hidden),
      ),
      textInputType:
          hidden ? TextInputType.text : TextInputType.visiblePassword,
      validator: widget.validator ?? (widget.verifyFormat ? PasswordValidator().validator : null),
      validatorMessage:
          widget.validatorMessage ?? PasswordValidator().errorMessage(verifyFormat: widget.verifyFormat),
    );
  }
}
