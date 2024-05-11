import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  String? loggedInUsername;

  void setLoggedInUser(String username) {
    loggedInUsername = username;
    notifyListeners();
  }
}
