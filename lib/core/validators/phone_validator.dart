import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import 'validator.dart';

class PhoneValidator extends Validator {
  @override
  bool isValid(String? value, {bool strict = true}) =>
      super.isValid(value, strict: strict) &&
      (PhoneNumber.parse(value.toString(), callerCountry: IsoCode.FR))
          .isValid();

  @override
  String? errorMessage(
          {String? message, bool override = false, String? value}) =>
      super.isValid(value)
          ? super.errorMessage(
              message: "Le numéro de téléphone a un mauvais format",
              override: true)
          : super.errorMessage(
              message: "le numéro de téléphone", override: override);
}
