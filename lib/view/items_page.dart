import 'package:first_app/utils/mytext_util.dart';
import 'package:first_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.appbar(leading: false),
      body: SafeArea(
          child: SingleChildScrollView(
        child: MyText(text: "Items Page"),
      )),
    );
  }
}
