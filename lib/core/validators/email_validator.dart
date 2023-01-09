import 'validator.dart';

class EmailValidator extends Validator {
  @override
  bool isValid(String? value, {bool strict = true}) =>
      super.isValid(value, strict: strict) &&
      (RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')).hasMatch(value ?? '');

  @override
  String? errorMessage(
          {String? message, bool override = false, String? value}) =>
      super.isValid(value)
          ? super.errorMessage(
              message: "L'adresse e-mail a un mauvais format", override: true)
          : super.errorMessage(message: "l'adresse e-mail", override: override);
}
