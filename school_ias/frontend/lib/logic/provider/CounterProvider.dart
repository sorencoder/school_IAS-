import 'package:flutter/material.dart';

class CounterProvier extends ChangeNotifier {
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }
}
