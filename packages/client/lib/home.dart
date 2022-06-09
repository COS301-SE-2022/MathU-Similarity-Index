import 'package:flutter/material.dart';
import 'package:client/nav_bar.dart';
import 'package:client/search_bar.dart';
import 'package:client/searchhistory.dart';
import 'package:client/viewAllProblems.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.history}) : super(key: key);
  final List<String> history;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SearchObject> results = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SearchBar(results: results, history: widget.history),
            ),
            Column(
              children: <Widget>[
                TextButton(
                  child: Text('History'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/searchhistory.dart');
                  },
                ),
                TextButton(
                  child: Text('View All'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewAllProblems.dart');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
