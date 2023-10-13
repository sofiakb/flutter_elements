class Validator {
  late String? prefixMessage;

  Validator({this.prefixMessage = 'Merci de renseigner'});

  bool isNotEmpty(String? value, {bool strict = true}) =>
      strict ? !(value == null || value.isEmpty) : !(value == null);

  bool isValid(String? value, {bool strict = true}) =>
      isNotEmpty(value, strict: strict);

  String? validator(String? value) =>
      isValid(value) ? null : errorMessage(message: "le champ", value: value);

  String? errorMessage(
          {String? message, String? value, bool override = false}) =>
      override == true ? message : '$prefixMessage $message';
}
