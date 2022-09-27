// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:client/apiInterface.dart';

import 'package:flutter/material.dart';

import 'package:client/NavigationDrawer.dart';

var PastPapers_List;
var All_PastPaper_List;
var PastPapers_List_1;

Future<List<dynamic>> getPastPapers(BuildContext context) async {
  List<dynamic> NewPastPapers = await apiObj.getMathPastPaperData();
  PastPapers_List = NewPastPapers;
  All_PastPaper_List = NewPastPapers;
  PastPapers_List_1 = NewPastPapers;

  return NewPastPapers;
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

  void getPastPaper(var inputurl) {
    final url = inputurl;
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
                            PastPapers_List.where((dynamic note) {
                          var pastpaperName = note['name'].toLowerCase();
                          var pastpaperlanguage =
                              note['language'].toLowerCase();
                          var pastpaperyear =
                              note['year'].toString().toLowerCase();
                          var pastpapercurriculum =
                              note['curriculum'].toString().toLowerCase();

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
                                        getPastPaper(PastPapers_List[index]
                                            ['downloadlink']);
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
                                                    ['curriculum'],
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
                                                PastPapers_List[index]['year']
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
                                                PastPapers_List[index]['month'],
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
                                                PastPapers_List[index]['name'],
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
                                                    ['language'],
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
