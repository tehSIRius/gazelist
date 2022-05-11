class Validator {
  static String? validateName(String? name) {
    if (name == null || name.isNotEmpty) {
      return null;
    }

    return 'Name cannot be empty';
  }

  static String? validateEmail(String? email) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Email is not in correct format';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }
}
