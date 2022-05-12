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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: NavBar(),
        body: SearchBar(),
      ),
    );
  }
}
