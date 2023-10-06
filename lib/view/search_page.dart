import 'package:first_app/model/provider.dart';
import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:first_app/view/food_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  void initFav(BuildContext context, int range) {
    Provider.of<FavouriteProvider>(context,listen: false).initAllFalse(range);
  }

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int range = 10;

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
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(children: [
                Consumer<SearchProvider>(builder: (context, provider, _) {
                  return Form(
                    key: _formKey,
                    child: MySearchField(
                      onsaved: () {
                        fetchSearchedData(provider, context);
                        widget.initFav(context, range);
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
              searchController.text.toString().trim().isEmpty
                  ? Column(
                      children: [
                        MyText(text: "Recent searches.."),
                        Consumer<SearchProvider>(
                            builder: (context, provider, _) {
                          return Container(
                            height: Get.height * 0.5,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      searchController.text =
                                          provider.searches[index];
                                      fetchSearchedData(provider, context);
                                    },
                                    leading: Icon(Icons.find_replace_outlined),
                                    title:
                                        MyText(text: provider.searches[index]),
                                  );
                                }),
                          );
                        }),
                      ],
                    )
                  : Consumer<SearchProvider>(builder: (context, provider, _) {
                      return Expanded(
                        child: provider.matchData.length == 0
                            ? Container(
                                child: Center(
                                    child: MyText(
                                text: "No Data Found",
                                fontSize: 40,
                              )))
                            : Column(
                                children: [
                                  MyText(
                                    text:
                                        "Found ${provider.matchData.length * 5} results",
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  Utils.sizedBox(),
                                  Expanded(
                                    child: GridView.builder(
                                        itemCount: provider.matchData.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                // crossAxisSpacing: 10,
                                                // mainAxisSpacing: 10,
                                                crossAxisCount: 2),
                                        itemBuilder: ((context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                bottom: 20,
                                                left: 15,
                                                right: 15),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 207, 207, 207),
                                                      blurRadius: 10),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: SearchedItemWidget(
                                                index: index),
                                          );
                                        })),
                                  ),
                                ],
                              ),
                      );
                    }),
            ],
          ),
        ),
      ),
    );
  }

  void fetchSearchedData(SearchProvider provider, BuildContext context) {
    provider.searchValue = searchController.text.toString().trim();
    if (provider.searchValue.isNotEmpty) {
      provider.addIntoSearch(provider.searchValue);
      provider.matchSearch(provider.searchValue);
      print(provider.matchData);
    }
    setState(() {
      range = provider.matchData.length;
    });

    provider.save();
    FocusScope.of(context).unfocus();
  }
}

class SearchedItemWidget extends StatelessWidget {
  final int index;
  const SearchedItemWidget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> searchOrderButton = [
      "Coffee",
      "Drinks",
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://1000logos.net/wp-content/uploads/2016/12/Starbucks-logo.jpg"),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 194, 194, 194),
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: 80,
                  height: 80,
                ),
              ),
              Positioned(
                  top: 2,
                  left: 75,
                  child: Container(
                    alignment: Alignment.center,
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 184, 184, 184),
                            blurRadius: 7,
                          )
                        ],
                        color: Colors.amber[700],
                        borderRadius: BorderRadius.circular(10)),
                    child: MyText(
                      text: "4.3",
                      textAlign: TextAlign.center,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )),
              Align(
                alignment: Alignment.topRight,
                child: Consumer<FavouriteProvider>(
                    builder: (context, provider, _) {
                  bool ind = provider.fav[index];
                  return IconButton(
                    onPressed: () => provider.changeFav(index),
                    icon: Icon(
                      Icons.favorite,
                      color: ind
                          ? Colors.red
                          : const Color.fromARGB(255, 195, 195, 195),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer<SearchProvider>(builder: (context, provider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Utils.sizedBox(height: 4),
                MyText(text: provider.matchData[index].toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          color: Colors.green,
                          size: 20,
                        ),
                        Text("\$5"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Colors.green,
                          size: 18,
                        ),
                        Text("10-15 min")
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    for (var i in searchOrderButton)
                      BuyActionButton(
                        text: i,
                        buttonHeight: 20,
                        buttonWidth: 65,
                        textFontSize: 16,
                        buttonColor: Colors.white,
                        textColor: Colors.black,
                      ),
                  ],
                )
              ],
            );
          }),
        ),
      ],
    );
  }
}
