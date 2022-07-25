//Imports
import 'package:flutter/material.dart';
import 'package:client/home.dart';
import 'package:client/searchhistory.dart';
import 'package:client/viewAllProblems.dart';
import 'package:client/calculations.dart';
import 'package:client/pastpapers.dart';

List<String> history = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MathU Similarity Index',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MathematicalTools(),
        routes: {
          '/home.dart': (context) => Home(history: history),
          '/searchhistory.dart': (context) => SearchHistory(history),
          '/viewAllProblems.dart': (context) => const viewAll(),
          '/pastpapers.dart': (context) => const PastPapers(),
          '/calculations.dart': (context) => const MathematicalTools(),
        });
  }
}
