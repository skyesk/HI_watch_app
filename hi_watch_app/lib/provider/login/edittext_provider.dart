import 'package:flutter/widgets.dart';

class LoginEditTextProvider with ChangeNotifier {
  int _id;
  String _password;

  LoginEditTextProvider(this._id, this._password);

  void setId(id) {
    this._id = id;
    notifyListeners();
  }

  void setPassword(password) {
    this._password = password;
    notifyListeners();
  }

  get id => this._id;
  get password => this._password;
}
