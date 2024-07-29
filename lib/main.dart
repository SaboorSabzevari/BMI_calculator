import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor:Color.fromARGB(236, 255, 255, 255),));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(236, 255, 255, 255),
        hintColor:const Color(0xFF56D0DB)
      ),
      home: const MyHomePage(),
    );
  }
}
