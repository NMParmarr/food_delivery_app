import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appbar(leading: false),
      body: SafeArea(
          child: SingleChildScrollView(
        child: MyText(text: "Food Page"),
      )),
    );
  }
}
