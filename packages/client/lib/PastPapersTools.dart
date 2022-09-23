import 'package:client/PastPapers/PastPapers.dart';
import 'dart:html' as html;
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'PastPapers/PastPapers.dart';
import 'package:client/NavigationDrawer.dart';

var PastPapers_List;
var All_PastPaper_List;
var PastPapers_List_1;

Future<List<PastPapers>> getPastPapers(BuildContext context) async {
  final response = await rootBundle.loadString(
      'https://fluttermathu.web.app/packages\client\assets\json/Mathspaper.json');

  PastPapers_List = (json.decode(response) as List)
      .map((i) => PastPapers.fromJson(i))
      .toList();
  All_PastPaper_List = PastPapers_List;
  return PastPapers_List;
}

class PastPaperTools extends StatefulWidget {
  const PastPaperTools({Key? key}) : super(key: key);

  @override
  State<PastPaperTools> createState() => _PastPaperToolsState();
}

const appcolour = Color(0xFF003255);

class _PastPaperToolsState extends State<PastPaperTools> {
  final controller = TextEditingController();
  bool _isFetching = true;
  @override
  void initState() {
    getPastPapers(context).whenComplete(() {
      setState(() {
        _isFetching = false;
      });
    });
    super.initState();
  }

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 720;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 720;

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
    return _isFetching
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: RichText(
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'P',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'ast  ',
                      style: TextStyle(color: Colors.white, fontSize: 36.0)),
                  TextSpan(
                      text: 'P',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'apers',
                      style: TextStyle(color: Colors.white, fontSize: 36.0)),
                ]),
              ),
              backgroundColor: const Color(0xFF003255),
            ),
            endDrawer: const NavigationDrawer(),
            body: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'eg. 2014 Mathematics June Memo *',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide:
                                  const BorderSide(width: 2, color: appcolour)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide:
                                  const BorderSide(width: 2, color: appcolour)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: const BorderSide(
                                  width: 2, color: appcolour))),
                      onChanged: (text) {
                        if (text.isEmpty) {
                          setState(() {
                            PastPapers_List = All_PastPaper_List;
                          });
                        }
                        text = text.toLowerCase();

                        PastPapers_List_1 =
                            PastPapers_List.where((PastPapers note) {
                          var pastpaperName = note.name.toLowerCase();
                          var pastpaperlanguage = note.Language.toLowerCase();
                          var pastpaperyear =
                              note.year.toString().toLowerCase();
                          var pastpapercurriculum =
                              note.Curriculum.toString().toLowerCase();

                          return pastpaperName.contains(text) ||
                              pastpaperlanguage.contains(text) ||
                              pastpaperyear.contains(text) ||
                              pastpapercurriculum.contains(text);
                        }).toList();

                        setState(() {
                          PastPapers_List = PastPapers_List_1;
                        });
                      },
                    )),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: PastPapers_List.length,
                            itemBuilder: ((BuildContext ctx, index) {
                              return Material(
                                  child: InkWell(
                                      onTap: () {
                                        getPastPaper(
                                            PastPapers_List[index]
                                                .year
                                                .toString(),
                                            PastPapers_List[index]
                                                .Grade
                                                .toString(),
                                            PastPapers_List[index]
                                                .Month
                                                .toString(),
                                            PastPapers_List[index]
                                                .name
                                                .toString());
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: appcolour,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              if (isDesktop(context))
                                                const Text(""),
                                              if (isDesktop(context))
                                                const Text(""),
                                              Text(
                                                PastPapers_List[index]
                                                    .Curriculum,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15 *
                                                      MediaQuery
                                                          .textScaleFactorOf(
                                                              context),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                PastPapers_List[index]
                                                    .year
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15 *
                                                      MediaQuery
                                                          .textScaleFactorOf(
                                                              context),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                PastPapers_List[index].Month,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15 *
                                                      MediaQuery
                                                          .textScaleFactorOf(
                                                              context),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                PastPapers_List[index].name,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15 *
                                                      MediaQuery
                                                          .textScaleFactorOf(
                                                              context),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                PastPapers_List[index].Language,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15 *
                                                      MediaQuery
                                                          .textScaleFactorOf(
                                                              context),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ))));
                            }))))
              ],
            ));
  }
}
