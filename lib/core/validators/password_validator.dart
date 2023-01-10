import 'validator.dart';

class PasswordValidator extends Validator {
  final bool strict;
  final bool upperLetter;
  final bool specialCharacter;
  final bool withNumber;
  final int minimumSize;

  PasswordValidator({
    this.strict = true,
    this.upperLetter = true,
    this.specialCharacter = false,
    this.withNumber = true,
    this.minimumSize = 8,
  });

  @override
  bool isValid(String? value, {bool strict = true}) {
    return super.isValid(value) && _isPasswordStrongEnough(value);
  }

  bool _isPasswordStrongEnough(String? value) {
    String regExpString;

    if (upperLetter && specialCharacter && withNumber) {
      regExpString =
          "(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-\+]).{$minimumSize,}\$";
    } else if (upperLetter && withNumber) {
      regExpString = "(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{$minimumSize,}\$";
    } else {
      regExpString = "^.{$minimumSize,}\$";
    }
    return (RegExp(regExpString)).hasMatch(value ?? '');
  }

  @override
  String? errorMessage(
      {String? message, String? value, bool override = false, bool verifyFormat = true}) {
    bool isCorrect = _isPasswordStrongEnough(value);
    return super.errorMessage(
        message: verifyFormat == false || isCorrect
            ? "le mot de passe"
            : "Le mot de passe n'est pas assez fort. \nIl doit contenir au moins\n${requirementsToString().replaceAll(", ", "SEPLINE").split("SEPLINE").map((e) => " - $e").join("\n")}",
        override: verifyFormat == false || isCorrect ? override : true);
  }

  String requirementsToString() {
    List<String> requirements = ["$minimumSize caractères", "1 lettre minuscule"];

    if (upperLetter)
      requirements.add("1 lettre majuscule");

    if (specialCharacter)
      requirements.add("1 caractère spécial");

    if (withNumber)
      requirements.add("1 chiffre");

    return requirements.join(", ");
  }
}
