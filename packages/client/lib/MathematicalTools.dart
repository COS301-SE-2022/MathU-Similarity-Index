// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names, constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'NavigationDrawer.dart';
import 'Mathematical Tools/Calculations.dart';
import 'Mathematical Tools/calculator.dart';

var Calculation_List;
var All_Calculation;
var Calculation_List_1;

Future<List<Calculations>> getCalculations(BuildContext context) async {
  final response =
      await rootBundle.loadString('json/MathematicalCalculation.json');

  Calculation_List = (json.decode(response) as List)
      .map((i) => Calculations.fromJson(i))
      .toList();
  All_Calculation = Calculation_List;
  return Calculation_List;
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
                      text: 'M',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'athematical ',
                      style: TextStyle(color: Colors.white, fontSize: 36.0)),
                  TextSpan(
                      text: 'Tools',
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
                          hintText: 'eg. Area Trapezium *',
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
                            Calculation_List = All_Calculation;
                          });
                        }
                        text = text.toLowerCase();

                        Calculation_List_1 =
                            Calculation_List.where((Calculations note) {
                          var calculationName =
                              note.calculationname.toLowerCase();
                          return calculationName.contains(text);
                        }).toList();

                        setState(() {
                          Calculation_List = Calculation_List_1;
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
                                                        .calculationID,
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
                                              .calculationname,
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
