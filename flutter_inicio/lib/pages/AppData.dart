import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  List<String> actions = [];

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    actions.add("Incrementó contador");
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    actions.add("Decrementó contador");
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    actions.add("Reinició contador");
    notifyListeners();
  }

  void addAction(String action) {
    actions.add(action);
    notifyListeners();
  }
}
