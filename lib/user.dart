import 'package:flutter/material.dart';

class User extends ChangeNotifier{

  String label = ' ';
  String info = ' ';

  void SignIn(String label, String info){
    label = label;
    info = info;
    notifyListeners();
  }
}