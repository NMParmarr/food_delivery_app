import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: MyText(text: "Filter"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Cuisines",
                textAlign: TextAlign.left,
              ),
              Utils.sizedBox(height: 10),
              Container(
                height: Get.height * 0.24,
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 7,
                        childAspectRatio: 2.5,
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return cuisionFilterItems();
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget cuisionFilterItems() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(
                "https://media-cdn.tripadvisor.com/media/photo-s/19/1f/2c/0a/photo6jpg.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MyText(text: "Salads"),
          )
        ],
      ),
    );
  }
}
