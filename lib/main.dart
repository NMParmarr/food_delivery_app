import 'package:first_app/model/provider.dart';
import 'package:first_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PriceRangeProvider>(
        create: (context) => PriceRangeProvider(),
      ),
      
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final String title = "Neon App";
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: myTheme(),
      initialRoute: RouteGenerator.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  ThemeData myTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
      useMaterial3: true,
      primaryColor: Colors.tealAccent,
    );
  }
}
