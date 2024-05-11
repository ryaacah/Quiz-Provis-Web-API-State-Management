import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  String? loggedInUsername;

  void setLoggedInUser(String username) {
    loggedInUsername = username;
    notifyListeners();
  }
}


// 2205714 Raya Cahya Nurani & 2206000 Septiani Eka Putri