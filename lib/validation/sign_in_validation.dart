import 'package:flutter/cupertino.dart';
import 'package:food_delivery/validation/validation_item.dart';

class SignInValidation with ChangeNotifier {
  ValidationItem _emailAddress = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  ValidationItem get emailAddress => _emailAddress;
  ValidationItem get password => _password;

  bool get isValid {
    if (_emailAddress.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void changeEmailAddress(String value) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
    if (RegExp(emailRegex).hasMatch(value)) {
      _emailAddress = ValidationItem(value, null);
    } else {
      _emailAddress = ValidationItem(null, "Invalid email address");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 8) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Must be at least 8 characters");
    }
    notifyListeners();
  }
}
