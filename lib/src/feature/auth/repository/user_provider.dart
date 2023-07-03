import 'package:flutter/material.dart';

import 'user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  UserProvider([
    this._user,
  ]);

  void setUser(User user) {
    user.userId = user.userId;
    _user = user;
    notifyListeners();
  }
}
