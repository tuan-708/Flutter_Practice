import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => this._counter;

  set counter(int value) => this._counter = value;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
