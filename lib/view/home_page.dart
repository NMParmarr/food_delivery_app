import 'package:first_app/route_generator.dart';
import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: homeBody());
  }

  Widget homeBody() {
    return SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            MyText(
              text: "Select your catagory",
              fontSize: 40,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            MyText(
              text: "You can always track and choose another catagory.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60),
            catagoryOptions(),
          ],
        ),
      ),
    ),
  );
  }

  Widget catagoryOptions() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              foodCatagoryOption(),
              MyText(
                text: "Or",
                color: const Color.fromARGB(255, 147, 135, 28),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              itemsCatagoryOption(),
            ],
          );
  }

  Widget itemsCatagoryOption() {
    return InkWell(
              onTap: () {
                Get.toNamed(RouteGenerator.foodPage);
              },
              child: Utils.catagory_container(
                  "https://img.freepik.com/premium-vector/tshirt-icon-comic-style-casual-clothes-cartoon-vector-illustration-white-isolated-background-polo-wear-splash-effect-business-concept_157943-6994.jpg",
                  "Items",
                  const Color.fromARGB(255, 31, 99, 33)),
            );
  }

  Widget foodCatagoryOption() {
    return InkWell(
              onTap: () {
                Get.toNamed(RouteGenerator.foodPage);
              },
              child: Utils.catagory_container(
                  "https://www.vedantu.com/seo/content-images/0867b892-336b-456a-89e7-a6056614cc26.png",
                  "Food",
                  Colors.red),
            );
  }
}
