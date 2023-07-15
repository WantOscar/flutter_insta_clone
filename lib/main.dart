import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/app.dart';
import 'package:flutter_instagram/src/binding/init_binding.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const App(),
      initialBinding: InitBinding(),
      // debugShowCheckedModeBanner: false,
    );
  }
}
