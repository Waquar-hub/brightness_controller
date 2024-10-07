import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void makeLight() {
    if(_isDarkTheme != false){
      print("light");
      _isDarkTheme = false;
      notifyListeners();
    }
  }


  void makeDark (){
    if(_isDarkTheme != true){
      print("dark");
      _isDarkTheme = true;
      notifyListeners();
    }
  }
}
