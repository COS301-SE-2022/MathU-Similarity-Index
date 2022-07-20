import 'package:flutter/material.dart';

class viewAll extends StatefulWidget {
  const viewAll({Key? key}) : super(key: key);

  @override
  State<viewAll> createState() => _viewAllState();
}

class _viewAllState extends State<viewAll> {
  List<String> problems = [
    "2x+3",
    "y-12",
    "(2x-6)/8",
    "x^2+9x+12",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository of Problems'),
        centerTitle: true,
        backgroundColor: Color(0xff002E50),
      ),
      body: Container(
        child: Column(
          children: problems
              .map((problem) => Card(
                    margin: EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(problem),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
