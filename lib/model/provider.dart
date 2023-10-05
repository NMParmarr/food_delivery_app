import 'package:flutter/material.dart';

class PriceRangeProvider extends ChangeNotifier {
  RangeValues values = RangeValues(1, 100);

  void changeValues(RangeValues value) {
    values = value;
    notifyListeners();
  }
}
