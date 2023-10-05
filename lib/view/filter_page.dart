import 'package:first_app/model/provider.dart';
import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:first_app/view/demo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> cuisions = [
    "Salads",
    "Fruits",
    "Soups",
    "Hyodhe",
    "Upyutess",
    "Poriues"
  ];
  List<String> sortBy = [
    "Popular",
    "Free delivery",
    "Nearest me",
    "Cost low to high",
    "Cost high to low",
    "Delivery time",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
              Utils.sizedBox(),
              Wrap(
                children: [
                  cuisionFilterItems(cuisions[0], true, selected: true),
                  cuisionFilterItems(cuisions[1], true),
                  cuisionFilterItems(cuisions[2], true),
                  cuisionFilterItems(cuisions[3], true),
                  cuisionFilterItems(cuisions[4], true),
                  cuisionFilterItems(cuisions[5], true),
                ],
              ),

              // cuisinesChoicesGrid(itemCount: 6, items: cuisions, isImage: true),
              Utils.sizedBox(),

              ////////////////////////////
              ///sort by filter
              MyText(
                text: "Sort by",
                textAlign: TextAlign.left,
              ),
              Wrap(
                children: [
                  for (var i in sortBy) cuisionFilterItems(i, false)
                  // cuisionFilterItems(sortBy[0], false, selected: true),
                  // cuisionFilterItems(sortBy[1], false),
                  // cuisionFilterItems(sortBy[2], false),
                  // cuisionFilterItems(sortBy[3], false),
                  // cuisionFilterItems(sortBy[4], false),
                  // cuisionFilterItems(sortBy[5], false),
                ],
              ),

              Utils.sizedBox(),
              // cuisinesChoicesGrid(itemCount: 6, items: sortBy),
              // cuisionFilterItems("Demo54545", false),
              // Container(
              //   height: Get.height * 0.144,
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: cuisions.length,
              //       itemBuilder: (context, index) {
              //         return cuisionFilterItems(cuisions[index], false);
              //       }),
              // )

              ///////////////////
              //Rating
              Utils.sizedBox(),
              MyText(
                text: "Rating",
                textAlign: TextAlign.left,
              ),
              Utils.sizedBox(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sortByRatingContainer("5"),
                  sortByRatingContainer("4", selected: true),
                  sortByRatingContainer("3"),
                  sortByRatingContainer("2"),
                  sortByRatingContainer("1"),
                ],
              ),

              /////////////////////////////
              ///Price range

              Utils.sizedBox(),
              Utils.sizedBox(),
              Utils.sizedBox(),
              MyText(
                text: "Praice Range",
                textAlign: TextAlign.left,
              ),
              Utils.sizedBox(),

              Consumer<PriceRangeProvider>(
                builder: (context, provider, _) {
                  return RangeSlider(
                      activeColor: Colors.red[700],
                      inactiveColor: Colors.red[300],
                      min: 1,
                      max: 100,
                      values: provider.values,
                      onChanged: (value) => provider.changeValues(value));
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    actionButton("reset",
                        color: Colors.white,
                        onpress: () {},
                        shadowColor: Colors.red,
                        textColor: Colors.red),
                    actionButton("Apply",
                        onpress: () => Get.to(Demo()),
                        color: Colors.red,
                        shadowColor: Colors.black,
                        textColor: Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Container actionButton(String text,
      {required Color color,
      required Function() onpress,
      required Color shadowColor,
      required Color textColor}) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: shadowColor,
              elevation: 7,
              backgroundColor: color,
              fixedSize: Size(150, 55)),
          onPressed: onpress,
          child: MyText(
            text: text,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: textColor,
          )),
    );
  }

  Container sortByRatingContainer(String stars, {bool selected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: BoxDecoration(
          color: selected ? Colors.amber : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 211, 211, 211),
                offset: Offset(0, 0),
                blurRadius: 6)
          ]),
      child: Row(
        children: [
          MyText(text: stars),
          Icon(Icons.star),
        ],
      ),
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
          mainAxisSize: MainAxisSize.min,
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
