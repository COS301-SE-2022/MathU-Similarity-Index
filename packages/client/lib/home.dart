import 'package:flutter/material.dart';
import 'nav_bar.dart';
import 'search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchBar(),
    );
  }
}
