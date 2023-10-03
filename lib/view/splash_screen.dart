import 'dart:async';

import 'package:first_app/model/getx_controllers.dart';
import 'package:first_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashIconController = Get.put(SplashIconController());
  int x = 1;

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      splashIconController.increseRadius();
    });
    Timer(Duration(seconds: 3), () {
      Get.offNamed(RouteGenerator.homePage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: AnimatedContainer(
            duration: Duration(seconds: 9),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.tealAccent,
                  radius: splashIconController.radius.value,
                  foregroundImage: NetworkImage(
                      "https://play-lh.googleusercontent.com/pEZvyjV4HNa9dwxYB4g-YzRVmbtNEwKdo_YpGbkDucVftFAx93gXrXYJYnTaT8TaDg"),
                )
              ],
            )),
          ),
        ));
  }
}
