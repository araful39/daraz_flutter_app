class AppValidators {
  // Singleton instance
  static final AppValidators _instance = AppValidators._internal();

  // Private constructor
  AppValidators._internal();

  // Factory constructor
  factory AppValidators() => _instance;

  /* ----------------------------------------------------------
   *   REQUIRED VALIDATOR
   * ---------------------------------------------------------- */
  String? requiredValidator(
    String? value, {
    String message = 'This field is required',
  }) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  /* ----------------------------------------------------------
   *   BUSINESS NAME
   * ---------------------------------------------------------- */
  String? businessNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter business name";
    }
    if (value.trim().length < 2) {
      return "Business name must be at least 2 characters";
    }

    final regex = RegExp(r"^[a-zA-Z0-9\s\.\-&']+$");
    if (!regex.hasMatch(value.trim())) {
      return "Enter a valid business name";
    }

    return null;
  }

  /* ----------------------------------------------------------
   *   PIN CODE (4 Digit)
   * ---------------------------------------------------------- */
  String? validate4DigitPinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter the 4-digit code';
    }
    if (!RegExp(r'^\d{4}$').hasMatch(value)) {
      return '4 Digit Code is invalid';
    }
    return null;
  }

  /* ----------------------------------------------------------
   *   PHONE NUMBER
   * ---------------------------------------------------------- */
  String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }

    final RegExp phoneExp = RegExp(r'^\d{7,15}$');
    if (!phoneExp.hasMatch(value.replaceAll(' ', ''))) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  /* ----------------------------------------------------------
   *   NAME VALIDATOR
   * ---------------------------------------------------------- */
  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your full name';
    }

    final nameRegExp = RegExp(r"^[a-zA-Z\s'-]+$");
    if (!nameRegExp.hasMatch(value.trim())) {
      return 'Name contains invalid characters';
    }

    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long';
    }

    return null;
  }

  /* ----------------------------------------------------------
   *   EMAIL VALIDATOR
   * ---------------------------------------------------------- */
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';

    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /* ----------------------------------------------------------
   *   PASSWORD VALIDATOR
   * ---------------------------------------------------------- */
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    // OPTIONAL: You can enable these for strong passwords:
    // if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Add at least 1 uppercase letter';
    // if (!RegExp(r'[0-9]').hasMatch(value)) return 'Add at least 1 number';
    // if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) return 'Add at least 1 special character';

    return null;
  }

  /* ----------------------------------------------------------
   *   CONFIRM PASSWORD
   * ---------------------------------------------------------- */
  String? confirmPasswordValidator(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  /* ----------------------------------------------------------
   *   NUMERIC VALIDATORS
   * ---------------------------------------------------------- */
  String? budgetValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your budget';
    }

    final num? budget = num.tryParse(value);
    if (budget == null || budget <= 0) {
      return 'Enter a valid positive number';
    }

    return null;
  }

  String? daysValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter number of days';
    }

    final int? days = int.tryParse(value);
    if (days == null || days < 0) {
      return 'Enter a valid number of days';
    }

    return null;
  }

  String? hoursValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter number of hours';
    }

    final int? hours = int.tryParse(value);
    if (hours == null || hours < 0 || hours > 23) {
      return 'Enter a valid hour (0-23)';
    }

    return null;
  }

  String? minutesValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter number of minutes';
    }

    final int? minutes = int.tryParse(value);
    if (minutes == null || minutes < 0 || minutes > 59) {
      return 'Enter a valid minute (0-59)';
    }

    return null;
  }

  /* ----------------------------------------------------------
   *   ADDRESS VALIDATORS
   * ---------------------------------------------------------- */
  String? addressValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address is required';
    }
    if (value.trim().length < 10) {
      return 'Address must be at least 10 characters long';
    }

    return null;
  }

  String? cityValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'City is required';
    }
    if (value.length < 2) {
      return 'City name must be at least 2 characters long';
    }

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'City name must contain only letters';
    }

    return null;
  }

  String? stateValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'State is required';
    }
    if (value.length < 2) {
      return 'State name must be at least 2 characters long';
    }

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'State name must contain only letters';
    }

    return null;
  }

  String? zipValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'ZIP code is required';
    }

    if (!RegExp(r'^\d{4,10}$').hasMatch(value)) {
      return 'Enter a valid ZIP code';
    }

    return null;
  }

  /* ----------------------------------------------------------
   *   ABOUT ME
   * ---------------------------------------------------------- */
  String? aboutMeValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please write something about yourself';
    }
    if (value.length > 300) {
      return 'Maximum 300 characters allowed';
    }

    return null;
  }
}
