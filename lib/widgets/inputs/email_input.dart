library sofiakb_elements;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sofiakb_elements/core/validators/email_validator.dart';

import 'custom_input.dart';

class EmailInput extends StatefulWidget {
  EmailInput({
    Key? key,
    this.title,
    this.hintText,
    this.controller,
    this.isObscure = false,
    this.enabled,
    this.errorMessage,
    this.isFocus = false,
    this.withIcon = false,
    this.required = false,
    this.validator,
    this.validatorMessage,
    this.onChanged,
    this.autocorrect = false,
    this.labelIcon
  }) : super(key: key);

  final String? hintText;
  final String? title;
  final bool? enabled;
  final bool isFocus;
  final bool required;

  final bool? withIcon;

  final TextEditingController? controller;
  final bool isObscure;

  final String? errorMessage;

  String? Function(String? value)? validator = (String? value) => null;
  final String? validatorMessage;

  final Function(String)? onChanged;

  final bool autocorrect;

  final IconData? labelIcon;

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  String? errorMessage;

  @override
  void initState() {
    errorMessage = widget.errorMessage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      title: widget.title ?? "Adresse e-mail",
      hintText: widget.hintText ?? "Adresse e-mail",
      controller: widget.controller,
      isObscure: widget.isObscure,
      isFocus: widget.isFocus,
      enabled: widget.enabled,
      required: widget.required,
      textInputType: TextInputType.emailAddress,
      errorMessage: widget.errorMessage,
      onChanged: widget.onChanged,
      autocorrect: widget.autocorrect,
      labelIcon: widget.withIcon == true ? widget.labelIcon ?? FontAwesomeIcons.lightAt : null,
      validator: widget.validator ?? EmailValidator().validator,
      validatorMessage:
          widget.validatorMessage ?? EmailValidator().errorMessage(),
    );
  }
}
