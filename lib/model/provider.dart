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

  List<String> searchData = [
    "nayan",
    "neon",
    "Olivia",
    "Emma",
    "Charlotte",
    "Amelia",
    "Sophia",
    "Isabella",
    "Ava",
    "Mia",
    "Evelyn",
    "Luna",
    "Harper",
    "Camila",
    "Sofia",
    "Scarlett",
    "Elizabeth",
    "Eleanor",
    "Emily",
    "Chloe",
    "Mila",
    "Violet",
    "Penelope",
    "Gianna",
    "Aria",
    "Abigail",
    "Ella",
    "Avery",
    "Hazel",
    "Nora",
    "Layla",
    "Lily",
    "Aurora",
    "Nova",
    "Ellie",
    "Madison",
    "Grace",
    "Isla",
    "Willow",
    "Zoe",
    "Riley",
    "Stella",
    "Eliana",
    "Ivy",
    "Victoria",
    "Emilia",
    "Zoey",
  ];

  List<String> matchData = [''];

  String searchValue = "";

  bool isTextFieldEmpty(String value) {
    return value == '';
  }

  void matchSearch(String value) {
    matchData.clear();
    matchData.addAll(searchData.where((element) => element
        .toString()
        .trim()
        .toUpperCase()
        .contains(value.toString().trim().toUpperCase())));
    notifyListeners();
  }

  void addIntoSearch(String value) {
    String lastSearch = searches[0];
    if (lastSearch != value) {
      searches.insert(0, value);
    }

    notifyListeners();
  }

  void save() {
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}

class FavouriteProvider extends ChangeNotifier {
  bool isFav = false;

  List<bool> fav = [];

  void initAllFalse(int range) {
    for (int i = 0; i < range; i++) {
      fav.insert(i, false);
    }

  }

  void changeFav(int index) {
    if (fav[index] == true) {
      fav[index] = false;
    } else {
      fav[index] = true;
    }
    isFav ? isFav = false : isFav = true;
    notifyListeners();
  }
}
