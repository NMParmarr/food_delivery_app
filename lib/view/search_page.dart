import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:first_app/view/food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  List<String> searches = [
    "Asian noodles isnles",
    "Dominsa Pizza",
    "Burgers",
    "Freches Fries",
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 217, 217, 217),
        appBar: Utils.appbar(
            icon: Icons.arrow_back_ios,
            leading: true,
            centerChild: Container(
                margin: EdgeInsets.only(top: 10),
                child: MyText(text: "Search"))),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                Hero(
                  tag: "search",
                  child: MySearchField(
                    searchController: searchController,
                    ontap: () {},
                    readonly: false,
                    autoFocus: true,
                  ),
                )
              ]),
              Utils.sizedBox(),
              MyText(text: "Recent searches.."),
              Container(
                height: Get.height * 0.5,
                child: ListView.builder(
                    itemCount: searches.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.find_replace_outlined),
                        title: MyText(text: searches[index]),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
