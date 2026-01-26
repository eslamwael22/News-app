import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/screens/on_boarding.dart';
import 'package:news_app/services/news_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: OnBoarding());
  }
}
