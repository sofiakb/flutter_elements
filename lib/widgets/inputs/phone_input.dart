import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sofiakb_elements/core/validators/phone_validator.dart';

import 'custom_input.dart';

class PhoneInput extends StatefulWidget {
  PhoneInput({
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
  }) : super(key: key);

  final String? hintText;
  final String? title;
  final bool? enabled;
  final bool isFocus;

  final bool? withIcon;

  final TextEditingController? controller;
  final bool isObscure;
  final bool required;

  final String? errorMessage;

  String? Function(String? value)? validator = (String? value) => null;
  final String? validatorMessage;

  final Function(String)? onChanged;

  final bool autocorrect;

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  String? errorMessage;

  @override
  void initState() {
    errorMessage = widget.errorMessage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      title: widget.title ?? "Numéro de téléphone",
      hintText: widget.hintText ?? "Numéro de téléphone",
      controller: widget.controller,
      isObscure: widget.isObscure,
      isFocus: widget.isFocus,
      enabled: widget.enabled,
      textInputType: TextInputType.phone,
      errorMessage: widget.errorMessage,
      required: widget.required,
      onChanged: widget.onChanged,
      autocorrect: widget.autocorrect,
      labelIcon:
          widget.withIcon == true ? FontAwesomeIcons.lightMobileNotch : null,
      validator: widget.validator ?? PhoneValidator().validator,
      validatorMessage:
          widget.validatorMessage ?? PhoneValidator().errorMessage(),
    );
  }
}
