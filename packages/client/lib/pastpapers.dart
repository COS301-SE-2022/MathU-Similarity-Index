import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'NavigationDrawer.dart';
import 'package:client/titlebar.dart';

const appcolour = const Color(0xFF003255);

class PastPapers extends StatefulWidget {
  const PastPapers({Key? key}) : super(key: key);

  @override
  _PastPapersState createState() => _PastPapersState();
}

class _PastPapersState extends State<PastPapers> {
  void downloadFile(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download; //in my case is .pdf
    // anchorElement.download = "myDocument.pdf";
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      endDrawer: NavigationDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'PAST',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            TextSpan(
                text: ' PAPERS',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        backgroundColor: appcolour,
      ),
      body: Container(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 12.5,
        mainAxisSpacing: 12.5,
        maxCrossAxisExtent: 250.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '1')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '2')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '3')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 3',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '4')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 4',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '5')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 5',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '6')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 6',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '7')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 7',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '8')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 8',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Year(grade: '9')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 9',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Year(grade: '10')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 10',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Year(grade: '11')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 11',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Year(grade: '12')),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Grade 12',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      )),
    );
  }
}

class Year extends StatefulWidget {
  const Year({Key? key, required this.grade}) : super(key: key);
  final String grade;

  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  void downloadFile(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download; //in my case is .pdf
    // anchorElement.download = "myDocument.pdf";
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'PAST',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            TextSpan(
                text: ' PAPERS',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        backgroundColor: appcolour,
      ),
      body: Container(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 12.5,
        mainAxisSpacing: 12.5,
        maxCrossAxisExtent: 250.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2022',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2022',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2021',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2021',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2020',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2019',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2019',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2018',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2018',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2017',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2017',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2016',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2016',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2015',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2015',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Period(
                          year: '2014',
                          grade: widget.grade,
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('2014',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      )),
    );
  }
}

class Paper extends StatefulWidget {
  const Paper(
      {Key? key, required this.grade, required this.year, required this.period})
      : super(key: key);
  final String grade;
  final String year;
  final String period;

  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  void downloadFile(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download; //in my case is .pdf
    // anchorElement.download = "myDocument.pdf";
    anchorElement.click();
  }

  void getPastPaper(String year, String grade, String period, String paper) {
    final url = 'assets/MathematicsPastPapers/' +
        year +
        '/' +
        grade +
        '/' +
        period +
        '/' +
        paper +
        '.pdf';
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download; //in my case is .pdf
    // anchorElement.download = "myDocument.pdf";
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'PAST',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            TextSpan(
                text: ' PAPERS',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        backgroundColor: appcolour,
      ),
      body: Container(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 12.5,
        mainAxisSpacing: 12.5,
        maxCrossAxisExtent: 250.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              getPastPaper(widget.year, widget.grade, widget.period,
                  'Paper 1 Question Paper.pdf');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Paper 1 Question Paper',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              getPastPaper(
                  widget.year, widget.grade, widget.period, 'Paper 1 Memo');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Paper 1 Memo.pdf',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              getPastPaper(widget.year, widget.grade, widget.period,
                  'Paper 2 Question Paper');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Paper 2 Question Paper.pdf',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              getPastPaper(
                  widget.year, widget.grade, widget.period, 'Paper 2 Memo.pdf');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('Paper 2 Memo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      )),
    );
  }
}

class Period extends StatefulWidget {
  const Period({Key? key, required this.grade, required this.year})
      : super(key: key);
  final String grade;
  final String year;

  @override
  _PeriodState createState() => _PeriodState();
}

class _PeriodState extends State<Period> {
  void downloadFile(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download; //in my case is .pdf
    // anchorElement.download = "myDocument.pdf";
    anchorElement.click();
  }

  void getPastPaper(String year, String grade, String paper) {
    // final url = 'assets/Mathe' + ;
    // html.AnchorElement anchorElement = html.AnchorElement(href: url);
    // anchorElement.download; //in my case is .pdf
    // // anchorElement.download = "myDocument.pdf";
    // anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'PAST',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            TextSpan(
                text: ' PAPERS',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ]),
        ),
        backgroundColor: appcolour,
      ),
      body: Container(
          child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 12.5,
        mainAxisSpacing: 12.5,
        maxCrossAxisExtent: 250.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Paper(
                          year: widget.year,
                          grade: widget.grade,
                          period: 'June',
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('June',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Paper(
                          year: widget.year,
                          grade: widget.grade,
                          period: 'November',
                        )),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              color: appcolour,
              child: const Text('November',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      )),
    );
  }
}
