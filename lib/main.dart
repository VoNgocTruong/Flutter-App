import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/pageHome.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const pageHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}