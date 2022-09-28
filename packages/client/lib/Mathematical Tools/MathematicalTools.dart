// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names, constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:flutter/services.dart';
import 'package:client/NavigationDrawer.dart';
import 'calculator.dart';

var Calculation_List = [];
var All_Calculation;
var Calculation_List_1;

Future<List<dynamic>> getCalculations(BuildContext context) async {
  List<dynamic> GetCalculations = await apiObj.getMathsCalculations();
  Calculation_List = GetCalculations;
  All_Calculation = GetCalculations;
  return GetCalculations;
}

class MathematicalTools extends StatefulWidget {
  const MathematicalTools({Key? key}) : super(key: key);

  @override
  State<MathematicalTools> createState() => _MathematicalToolsState();
}

const Color Calculator_background = Color(0xFF345b82);
const appcolour = Color(0xFF003255);

class _MathematicalToolsState extends State<MathematicalTools> {
  final controller = TextEditingController();
  bool _isFetching = true;
  @override
  void initState() {
    getCalculations(context).whenComplete(() {
      setState(() {
        _isFetching = false;
      });
    });
    super.initState();
  }

  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return _isFetching
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'M',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 25 * MediaQuery.textScaleFactorOf(context),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'athematical ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              25 * MediaQuery.textScaleFactorOf(context))),
                  TextSpan(
                      text: 'T',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 25 * MediaQuery.textScaleFactorOf(context),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'ools',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              25 * MediaQuery.textScaleFactorOf(context))),
                ]),
              ),
              backgroundColor: const Color(0xFF003255),
            ),
            endDrawer: const NavigationDrawer(),
            body: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: 'eg. Area Trapezium *',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                          width: 2, color: appcolour)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                          width: 2, color: appcolour)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(22),
                                      borderSide: const BorderSide(
                                          width: 2, color: appcolour))),
                              onChanged: (text) {
                                if (text.isEmpty) {
                                  setState(() {
                                    Calculation_List = All_Calculation;
                                  });
                                }
                                text = text.toLowerCase();

                                Calculation_List_1 =
                                    Calculation_List.where((dynamic note) {
                                  var calculationName =
                                      note['calculationname'].toLowerCase();
                                  return calculationName.contains(text);
                                }).toList();

                                setState(() {
                                  Calculation_List = Calculation_List_1;
                                });
                              },
                            )))
                  ],
                ),
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
                            itemCount: Calculation_List.length,
                            itemBuilder: ((BuildContext ctx, index) {
                              return Material(
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Calculator(
                                                    Answer: "",
                                                    Question: "",
                                                    id: Calculation_List[index]
                                                        ['calculationid'],
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: appcolour,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          Calculation_List[index]
                                              ['calculationname'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )));
                            }))))
              ],
            ));
  }

  // ignore: dead_code
}
