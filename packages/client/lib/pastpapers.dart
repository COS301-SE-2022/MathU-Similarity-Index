import 'package:flutter/material.dart';
import 'dart:html' as html;

const appcolour = Color(0xff083a55);

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('login_06.jpg'),
              fit: BoxFit.cover,
            ),
          ),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 5',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 6',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 7',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 8',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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

class G1PastPapers extends StatefulWidget {
  const G1PastPapers({Key? key}) : super(key: key);

  @override
  _G1PastPapersState createState() => _G1PastPapersState();
}

class _G1PastPapersState extends State<G1PastPapers> {
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('login_06.jpg'),
              fit: BoxFit.cover,
            ),
          ),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 5',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 6',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 7',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('Grade 8',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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
                        builder: (context) => const G2PastPapers()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
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

class G2PastPapers extends StatefulWidget {
  const G2PastPapers({Key? key}) : super(key: key);

  @override
  _G2PastPapersState createState() => _G2PastPapersState();
}

class _G2PastPapersState extends State<G2PastPapers> {
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('login_06.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 12.5,
            mainAxisSpacing: 12.5,
            maxCrossAxisExtent: 250.0,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2022',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2021',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2020',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2019',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2018',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2017',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2016',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2015',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2014',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2013',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2012',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2011',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2010',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2009',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  downloadFile('assets/Mathematics P1 Nov 2021 Eng.pdf');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.3),
                  child: const Text('2008',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          )),
    );
  }
}
