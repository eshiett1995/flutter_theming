import 'package:flutter/material.dart';


class CustomTheme extends ChangeNotifier{

  bool isDarkTheme = true;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static var appBarTheme = AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent
  );

  static ThemeData get darkTheme{
     return ThemeData(
       appBarTheme: appBarTheme,
       scaffoldBackgroundColor: Colors.black38,
       textTheme: ThemeData.dark().textTheme,
       primarySwatch: Colors.blue,
     );
  }

  static ThemeData get lightTheme{
    return ThemeData(
      appBarTheme: appBarTheme,
      textTheme: ThemeData.light().textTheme,
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
    );
  }
}