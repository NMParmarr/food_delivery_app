import 'package:first_app/model/getx_controllers.dart';
import 'package:first_app/route_generator.dart';
import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final searchController = TextEditingController();
  final selectedFoodController = Get.put(SelectedFoodController());

  List<String> foodCatagory = [
    "Gujarati",
    "Panjabi",
    "Snakki",
    "Haryani",
    "China",
    "Tamil",
    "Bhojpuri",
    "Bangali"
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 217, 217, 217),
        appBar: Utils.appbar(leading: false),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Center(
                    child: MyText(
                      text: "What would you like to order ??",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Utils.sizedBox(height: 5),

                  //search bar and filter button
                  MySearchBar(searchController: searchController),
                  Utils.sizedBox(height: 5),

                  // list view of food catagory
                  foodCatagoryListview(),
                  Utils.sizedBox(height: 17),

                  //featured restautrants list
                  featuredRestoTitle("Featured Restaurants", true),
                  featuredRestoItems(),
                  Utils.sizedBox(height: Get.height * 0.03),

                  //popular items list
                  featuredRestoTitle("Popular Items", false),
                  Utils.sizedBox(height: 7),
                  popularItems(),
                  Utils.sizedBox(height: 18),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container popularItems() {
    return Container(
      height: Get.height * 0.258,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(right: 20),
                duration: Duration(milliseconds: 120),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://media.tatler.com/photos/6141d013e2598f5f2d8d2632/master/w_320%2Cc_limit/90498875_439535526836230_1394913364805022480_n.jpg"),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            width: 140,
                            height: 140,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              MyText(
                                text: "Jerk Chicken",
                                fontWeight: FontWeight.bold,
                              ),
                              MyText(
                                text: "Neon Restaurant",
                                fontSize: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: EdgeInsets.only(top: 6, left: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(224, 241, 241, 241),
                          ),
                          child: MyText(text: "5.50")),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 58.0),
                        child: ratingView(
                            Alignment.bottomLeft, "4.5", true, "(20+)", 85),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Container featuredRestoItems() {
    return Container(
      height: Get.height * 0.242,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: AnimatedContainer(
                margin: EdgeInsets.only(right: 20),
                duration: Duration(milliseconds: 120),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://media.tatler.com/photos/6141d013e2598f5f2d8d2632/master/w_320%2Cc_limit/90498875_439535526836230_1394913364805022480_n.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: 280,
                height: 80,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    ratingView(Alignment.topLeft, "4.0", false, "25+", 140),
                    favouriteIcon(),
                    bottomDescription()
                  ],
                ),
              ),
            );
          }),
    );
  }

  Align bottomDescription() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 90,
        color: Colors.white,
        child: Column(children: [
          MyText(
            text: "Nagril",
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.delivery_dining,
                    color: Colors.green,
                  ),
                  Text("Free Delivery"),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.alarm,
                    color: Colors.green,
                  ),
                  Text("10-15 min")
                ],
              )
            ],
          ),
          Row(
            children: [
              BuyActionButton(
                buttonColor: Color.fromARGB(255, 203, 183, 2),
                text: "Buy",
              ),
              BuyActionButton(
                buttonColor: Color.fromARGB(255, 203, 183, 2),
                text: "Cart",
              ),
              BuyActionButton(
                buttonColor: Color.fromARGB(255, 203, 183, 2),
                text: "Save",
              ),
            ],
          )
        ]),
      ),
    );
  }

  Padding featuredRestoTitle(String title, bool viewAll) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            text: title,
            fontSize: 20,
          ),
          viewAll
              ? TextButton(
                  onPressed: () {},
                  child: MyText(
                    text: "View All >",
                    fontSize: 16,
                    color: Colors.red,
                  ))
              : SizedBox(),
        ],
      ),
    );
  }

  Padding favouriteIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.topRight,
        child: ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(), backgroundColor: Colors.red),
        ),
      ),
    );
  }

  Padding ratingView(Alignment align, String rating, bool oneStar,
      String ratingNum, double width) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Align(
        alignment: align,
        child: Container(
          width: width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              MyText(
                text: rating,
                fontSize: 13,
              ),
              oneStar
                  ? ratingStar()
                  : Row(
                      children: [
                        ratingStar(),
                        ratingStar(),
                        ratingStar(),
                        ratingStar(),
                      ],
                    ),
              MyText(
                text: ratingNum,
                fontSize: 10,
                color: const Color.fromARGB(255, 41, 41, 41),
              )
            ],
          ),
        ),
      ),
    );
  }

  Icon ratingStar() => Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15,
      );

  ///////////////////////////////////
  ///food catagory listview

  Container foodCatagoryListview() {
    return Container(
      height: 130,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodCatagory.length,
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  selectedFoodController.changeIndex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 120),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: index == selectedFoodController.index.value
                            ? Colors.redAccent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    width: 80,
                    height: 70,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.tealAccent,
                          radius: 35,
                          foregroundImage: NetworkImage(
                              "https://media.tatler.com/photos/6141d013e2598f5f2d8d2632/master/w_320%2Cc_limit/90498875_439535526836230_1394913364805022480_n.jpg"),
                        ),
                        Expanded(
                          child: Center(
                            child: MyText(
                              text: foodCatagory[index],
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

////////////////////////////////
  ///search bar and filter button
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MySearchField(
            searchController: searchController,
            ontap: () {
              Get.toNamed(RouteGenerator.searchPage);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 202, 202, 202),
                      blurRadius: 3,
                      spreadRadius: 1)
                ]),
            child: IconButton(
                onPressed: () {
                  Get.toNamed(RouteGenerator.filterPage);
                },
                icon: Icon(
                  Icons.filter_list_rounded,
                  color: Colors.red,
                  size: 30,
                  shadows: [
                    Shadow(
                        color: Colors.red, blurRadius: 2, offset: Offset(2, 1))
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

class MySearchField extends StatelessWidget {
  final Function() ontap;
  final bool readonly;
  final bool autoFocus;
  final void Function()? onsaved;
  final String? Function(String?)? validator;
  const MySearchField({
    required this.ontap,
    super.key,
    this.validator,
    this.onsaved,
    this.autoFocus = false,
    this.readonly = true,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onEditingComplete: onsaved,
      onTap: ontap,
      readOnly: readonly,
      autofocus: autoFocus,
      textAlignVertical: TextAlignVertical.center,
      controller: searchController,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        constraints: BoxConstraints(maxHeight: 50),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none, width: 0),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: "Find food or restaurant..",
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}

class BuyActionButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final double buttonWidth;
  final double buttonHeight;
  final double textFontSize;
  const BuyActionButton({
    super.key,
    this.buttonColor = Colors.yellow,
    this.textColor = Colors.white,
    this.buttonHeight = 30,
    this.buttonWidth = 80,
    this.textFontSize = 16,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: ElevatedButton(
          onPressed: () {},
          child: MyText(
            text: text,
            fontSize: textFontSize,
            color: textColor,
          ),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: buttonColor,
            padding: EdgeInsets.zero,
            // fixedSize: Size(25, 6)
          ),
        ),
      ),
    );
  }
}
