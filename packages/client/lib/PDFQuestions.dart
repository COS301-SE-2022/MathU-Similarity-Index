// ignore_for_file: non_constant_identifier_names

import 'package:client/Mathematical%20Tools/MathematicalTools.dart';
import 'package:client/Mathematical%20Tools/calculator.dart';
import 'package:client/titlebar.dart';
import 'package:flutter/material.dart';
import 'dart:math';
<<<<<<< Updated upstream
import 'package:http/http.dart' as http;
import 'dart:html' as html;
=======
>>>>>>> Stashed changes

import 'package:flutter/rendering.dart';

class PDFQuestions extends StatefulWidget {
  const PDFQuestions({super.key, required this.questions});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final List<String> questions;

  @override
  State<PDFQuestions> createState() => _PDFQuestionsState();
}

const appcolour = Color(0xFF003255);

String generateRandomString(int len) {
  var r = Random();
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

<<<<<<< Updated upstream
void downloadFile(String url) {
  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download; //in my case is .pdf
  // anchorElement.download = "myDocument.pdf";
  anchorElement.click();
}

void getQuestionPaper(String documentid) {
  final url = 'server\api\PDFQuestion API\JRNDFF.tex' + documentid + '.pdf';

  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download; //in my case is .pdf
  // anchorElement.download = "myDocument.pdf";
  anchorElement.click();
}

=======
>>>>>>> Stashed changes
class _PDFQuestionsState extends State<PDFQuestions> {
  static String Id = generateRandomString(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TitleBar(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  0, 30 * MediaQuery.textScaleFactorOf(context), 0, 0),
              alignment: Alignment.topCenter,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Document ',
                      style: TextStyle(
                          color: appcolour,
                          fontSize: 30 * MediaQuery.textScaleFactorOf(context),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'ID :  ',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 30 * MediaQuery.textScaleFactorOf(context),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: Id,
                      style: TextStyle(
                          color: appcolour,
                          fontSize: 30 * MediaQuery.textScaleFactorOf(context),
                          fontWeight: FontWeight.bold)),
                ]),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                margin:
                    EdgeInsets.all(175 * MediaQuery.textScaleFactorOf(context)),
                child: TextButton(
                    onPressed: () async {
                      String Questions = "";
                      for (var i = 0; i < widget.questions.length; i++) {
                        if (i < widget.questions.length - 1) {
                          Questions += widget.questions[i] + "*()*";
                        }
                      }
                      String idplusquestions = Id + "*_*" + Questions;
                      final url =
                          'https://mathuserver.azurewebsites.net:5000/converttopdf/?query=$idplusquestions';
                      final response = await http.get(Uri.parse(url));
                      getQuestionPaper(response.body);
                      setState(() {
                        Id = generateRandomString(10);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Create Pdf',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )))
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
