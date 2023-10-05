import 'package:first_app/utils/mytext_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List<String> cuisions = [
    "Salads",
    "Fruits",
    "Soups",
    "Hyodhe",
    "Upyutess",
    "Poriues"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 400,
          child: cuisinesChoicesGrid(items: cuisions, isImage: true)),
    );
  }

  Widget cuisinesChoicesGrid(
      {int itemCount = 6,
      double? height,
      required List<String> items,
      bool isImage = false}) {
    return Container(
      child: GridView(
          shrinkWrap: true,
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, index) {
            return cuisionFilterItems(items[index], isImage);
          }),
    );
  }

  Widget cuisionFilterItems(String item, bool isImage,
      {bool selected = false}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 211, 211, 211),
                  offset: Offset(0, 0),
                  blurRadius: 6)
            ],
            color: selected ? Colors.amber : Colors.white,
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            isImage
                ? CircleAvatar(
                    foregroundImage: NetworkImage(
                        "https://media-cdn.tripadvisor.com/media/photo-s/19/1f/2c/0a/photo6jpg.jpg"),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyText(
                text: item,
              ),
            )
          ],
        ),
      ),
    );
  }
}
