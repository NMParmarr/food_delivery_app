import 'package:flutter/material.dart';

class PriceRangeProvider extends ChangeNotifier {
  RangeValues values = RangeValues(1, 100);

  void changeValues(RangeValues value) {
    values = value;
    notifyListeners();
  }
}

class SearchProvider extends ChangeNotifier {
  List<String> searches = [
    "Asian noodles isnles",
    "Dominsa Pizza",
    "Burgers",
    "Freches Fries",
    "aaa",
    "bbb",
    "ccc",
  ];

  void addIntoSearch(String value) {
    String lastSearch = searches[0];
    if (lastSearch != value) {
      searches.insert(0, value);
    }
    notifyListeners();
  }
}
