import 'package:get/get.dart';

class SplashIconController extends GetxController {
  RxDouble radius = 5.0.obs;
  void increseRadius() {
    radius.value = 80;
  }
}
