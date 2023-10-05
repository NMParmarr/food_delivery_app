import 'package:first_app/model/provider.dart';
import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:first_app/view/food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String searchValue = "";

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
        backgroundColor: Color.fromARGB(255, 235, 235, 235),
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
                Consumer<SearchProvider>(builder: (context, provider, _) {
                  return Form(
                    key: _formKey,
                    child: MySearchField(
                      onsaved: () {
                        searchValue = searchController.text.toString().trim();
                        print(searchValue);
                        provider.addIntoSearch(searchValue);
                        FocusScope.of(context).unfocus();
                      },
                      searchController: searchController,
                      ontap: () {
                        searchController.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: searchController.text.length);
                      },
                      readonly: false,
                      autoFocus: true,
                    ),
                  );
                })
              ]),
              Utils.sizedBox(),
              MyText(text: "Recent searches.."),
              Container(
                height: Get.height * 0.5,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.find_replace_outlined),
                        title: Consumer<SearchProvider>(
                            builder: (context, provider, _) {
                          return MyText(text: provider.searches[index]);
                        }),
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
