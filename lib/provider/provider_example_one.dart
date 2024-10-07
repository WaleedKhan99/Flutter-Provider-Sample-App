import 'package:flutter/foundation.dart';

class ProviderExampleOne with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;

  void setValues(double val) {
    _value = val;
    notifyListeners();
  }
}
