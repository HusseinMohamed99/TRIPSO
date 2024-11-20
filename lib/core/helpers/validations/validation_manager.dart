part of './../export_manager/export_manager.dart';

class ValidationManager {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null ||
        displayName.isEmpty ||
        displayName.trim().isEmpty) {
      return ValidationMessage.nameValid;
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return ValidationMessage.nameValid;
    }
    return null;
  }

  static String? phoneValidator(String? phone) {
    if (phone == null || phone.isEmpty || phone.trim().isEmpty) {
      return ValidationMessage.phoneValid;
    }
    RegExp regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (!regex.hasMatch(phone)) {
      return 'ValidationMessage';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return ValidationMessage.emailValid;
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return ValidationMessage.emailValid;
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return ValidationMessage.otpValid;
    }
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      return ValidationMessage.otpValid;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return ValidationMessage.passwordValid;
    }
    if (value.length < 8) {
      return ValidationMessage.passwordError2;
    }
    RegExp regex = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#^~`+])[A-Za-z\d@$!%*?&#^~`+]{8,}$");
    var passNonNullValue = value;
    if (!regex.hasMatch(passNonNullValue)) {
      return ValidationMessage.passwordError1;
    }
    return null;
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&]{8,}$#")
        .hasMatch(password);
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return ValidationMessage.passwordNoMatch;
    }
    return null;
  }

  static String? birthDateValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationMessage.dateOfBirthValid;
    }

    final now = DateTime.now();
    final eighteenYearsAgo = now.subtract(const Duration(days: 6570));
    final seventyYearsAgo = now.subtract(const Duration(days: 25550));

    // Split the input string into day, month, and year
    final dateParts = value.split('-');
    if (dateParts.length != 3) {
      return ValidationMessage.dateOfBirthValid;
    }

    final day = int.tryParse(dateParts[0]) ?? -1;
    final month = int.tryParse(dateParts[1]) ?? -1;
    final year = int.tryParse(dateParts[2]) ?? -1;

    if (day < 1 || day > 31) {
      return ValidationMessage.dateOfBirthDayValidate;
    }

    if (month < 1 || month > 12) {
      return ValidationMessage.dateOfBirthMonthValidate;
    }

    if (year > now.year || year < seventyYearsAgo.year) {
      return ValidationMessage.dateOfBirthYearValidate;
    }

    if (year > eighteenYearsAgo.year) {
      return ValidationMessage.dateOfBirthError1;
    }

    return null;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
