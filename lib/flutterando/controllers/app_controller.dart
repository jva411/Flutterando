import 'package:flutter/widgets.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDdarkTheme = false;

  void toggleTheme() {
    isDdarkTheme = !isDdarkTheme;
    notifyListeners();
  }
}
