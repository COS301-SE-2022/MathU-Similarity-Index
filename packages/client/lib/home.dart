import 'package:flutter/material.dart';
import 'package:client/nav_bar.dart';
import 'package:client/search_bar.dart';
import 'package:client/viewAllProblems.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SearchObject> results = [
    SearchObject("2x+3", 100),
    SearchObject("y-12", 100),
    SearchObject("(2x-6)/8", 100),
    SearchObject("x^2+9x+12", 100)
  ];
  List<String> history = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: NavBar(),
        body: SearchBar(results: results, history: history),
      ),
    );
  }
}
