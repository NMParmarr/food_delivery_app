import 'package:get/get.dart';

class SplashIconController extends GetxController {
  RxDouble radius = 5.0.obs;
  void increseRadius() {
    radius.value = 80;
  }
}

class SelectedFoodController extends GetxController {
  RxInt index = 0.obs;

  void changeIndex(int ind) {
    index.value = ind;
  }
}

class RatingSelectionController extends GetxController {
  RxList<int> selectionItems = [1, 2, 3, 4, 5].obs;
  RxInt currentIndex = 1.obs;

  void currentSelection(int index) {
    for (int i in selectionItems) {
      if (i == index) {
        currentIndex.value = i;
      }
    }
  }
}
