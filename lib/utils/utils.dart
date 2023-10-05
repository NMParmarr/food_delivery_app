import 'package:first_app/utils/mytext_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//////////////////////
///appbar
//////////////////////

class Utils extends AppBar {
  static PreferredSizeWidget appbar(
          {bool leading = true,
          IconData icon = Icons.menu,
          Widget? centerChild}) =>
      PreferredSize(
          preferredSize: Size(100, 90),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 202, 202, 202),
                                    blurRadius: 2,
                                    spreadRadius: 1)
                              ]),
                          child: IconButton(
                              onPressed: () {
                                leading ? Get.back() : {};
                              },
                              icon: Icon(icon)),
                        ),
                        centerChild ??
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: ListTile(
                                  title: MyText(
                                    text: "Deliver to",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  trailing: Icon(Icons.arrow_drop_down),
                                  subtitle: MyText(
                                    text: "TW122AX",
                                    color:
                                        const Color.fromARGB(255, 169, 153, 6),
                                  ),
                                ),
                              ),
                            ),
                        CircleAvatar(
                          backgroundColor: Colors.tealAccent,
                          foregroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                          radius: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));

  //////////////////////
  ///catagory container
  ////////////////////
  static Container catagory_container(
          String url, String catagory_name, Color color) =>
      Container(
        width: Get.width * 0.37,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                offset: Offset(0, 1),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image(image: NetworkImage(url)),
              ),
              MyText(
                text: catagory_name,
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )
            ],
          ),
        ),
      );

//////////////////////////////////////
  /// circular image container
//////////////////////////////////////

  static Widget circular_contaier(String url) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image(image: NetworkImage(url)),
      );

//////////////////////////////////////
  /// custom sizedbox
//////////////////////////////////////

  static Widget sizedBox({double? height}) => SizedBox(
        height: height ?? Get.height * 0.018,
      );
}
