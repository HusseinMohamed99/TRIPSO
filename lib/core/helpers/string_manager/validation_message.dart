class ValidationMessage {
  // Email Validation
  static const String emailValid = 'Email cannot be empty';
  static const String verifyEmailValid =
      'Please enter the 4-digit code sent to your email';

  // Password Validation
  static const String passwordNoMatch = 'Passwords do not match';
  static const String passwordValid = 'Password cannot be empty';
  static const String passwordError2 =
      'Password must be at least 8 characters long';
  static const String passwordMissingLowerCase =
      'Include at least one lowercase letter';
  static const String passwordMissingUpperCase =
      'Include at least one uppercase letter';
  static const String passwordMissingNumber =
      'Include at least one numeric digit';
  static const String passwordMissingSpecial =
      'Include at least one special character';
  static const String updatePasswordSuccessfully =
      'Password updated successfully!';

  // OTP Validation
  static const String otpValid = 'Please enter a valid OTP';
  static const String otpError1 = 'OTP should be a 4-digit number';

  // Name Validation
  static const String nameValid = 'Please enter a valid name';
  static const String nameError1 = 'Name can only contain alphabets and spaces';

  // Date of Birth Validation
  static const String dateOfBirthValid = 'Please enter a valid date of birth';
  static const String dateOfBirthError1 = 'You must be 18 years old or above';
  static const String dateOfBirthYearValidate = 'Enter a valid year';
  static const String dateOfBirthMonthValidate = 'Enter a valid month';
  static const String dateOfBirthDayValidate = 'Enter a valid day';

  // Message Validation
  static const String messageValid = 'Please enter a valid message';

  // Phone Number Validation
  static const String phoneValid = 'Please enter a valid phone number';
}
