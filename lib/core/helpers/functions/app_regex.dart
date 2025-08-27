class AppRegex {
  AppRegex._();

  static bool isNameValid(String name) {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(name);
  }

  static bool isPhoneValid(String phone) {
    return RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(phone);
  }

  static bool isUsernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username);
  }

  static bool isWebsiteValid(String website) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(website);
  }

  static bool isUrlValid(String url) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(url);
  }

  static bool isImageUrlValid(String imageUrl) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(imageUrl);
  }

  static bool isVideoUrlValid(String videoUrl) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(videoUrl);
  }

  static bool isFileUrlValid(String fileUrl) {
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(fileUrl);
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp('^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp('^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp('^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[@$!%*?&])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp('^(?=.{8,})').hasMatch(password);
  }
}

/*
validator: (value) {
if (value == null || value.isEmpty) {
return 'Email cannot be empty';
}
if (!AppRegex.isEmailValid(value)) {
return 'Please enter a valid email address';
}
return null; // Validation passed
},*/

/*
validator: (value) {
if (value == null || value.isEmpty) {
return 'Password cannot be empty';
}
if (!AppRegex.isPasswordValid(value)) {
return 'Password must have:\n'
'- At least 8 characters\n'
'- At least 1 uppercase letter\n'
'- At least 1 lowercase letter\n'
'- At least 1 number\n'
'- At least 1 special character';
}
return null; // Validation passed
},*/

// fe el cubit
String? validateEmail(String? value) {
  // Check if email is empty
  if (value == null || value.isEmpty) {
    return 'Email field is required.';
  }

  // Use existing AppRegex for email validation
  if (!AppRegex.isEmailValid(value)) {
    return 'Please enter a valid email address';
  }

  // Optional: Additional custom validation rules
  if (!value.contains('@')) {
    return 'Email must contain @ symbol';
  }

  // Optional: Domain-specific validation
  final validDomains = ['gmail.com', 'outlook.com', 'yahoo.com'];
  final domain = value.split('@').last;
  if (!validDomains.contains(domain)) {
    return 'Please use a valid email domain';
  }

  // If all validations pass
  return null;
}



  String? validatePassword(String? value) {
    // Check if password is empty
    if (value == null || value.isEmpty) {
      return 'Password field is required.';
    }

    // Use existing AppRegex for password validation
    if (!AppRegex.isPasswordValid(value)) {
      return 'Password must have:\n'
          '- At least 8 characters\n'
          '- At least 1 uppercase letter\n'
          '- At least 1 lowercase letter\n'
          '- At least 1 number\n'
          '- At least 1 special character';
    }

    // If all validations pass
    return null;
  }

  /// Validates if a password meets security requirements:
  /// - At least 8 characters
  /// - At least 1 uppercase letter
  /// - At least 1 lowercase letter
  /// - At least 1 number
  /// - At least 1 special character
  /// 
  /// @param password The password string to validate
  // /// @return true if the password meets all requirements, false otherwise
  // bool isPasswordValid(String? password) {
  //   if (password == null || password.isEmpty) {
  //     return false;
  //   }
    
  //   final result = hasMinLength(password) && 
  //                 hasLowerCase(password) && 
  //                 hasUpperCase(password) && 
  //                 hasNumber(password) && 
  //                 hasSpecialCharacter(password);
    
  //   return result;
  // }
  
