import 'package:first_app/utils/mytext_util.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 30,
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: 300,
                          color: Colors.amber,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(),
                          ),
                        ),
                      );
                    });
              },
              child: MyText(text: "Open Bottom")),
        ),
      ),
    );
  }
}
