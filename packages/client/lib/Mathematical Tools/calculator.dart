// ignore_for_file: constant_identifier_names, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'calculatorui.dart';
import 'package:client/titlebar.dart';
import 'Calculator/calculatorscreen.dart';
import 'InputField_mathematicaltools/InputField.dart';
import 'Calculations.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:client/NavigationDrawer.dart';

var Calculation_List;

Future<List<Calculations>> getUser(BuildContext context) async {
  final response =
      await rootBundle.loadString('json/MathematicalCalculation.json');

  Calculation_List = (json.decode(response) as List)
      .map((i) => Calculations.fromJson(i))
      .toList();
  return Calculation_List;
}

class Calculator extends StatefulWidget {
  final String Answer;
  final int id;
  final String Question;
  const Calculator(
      {Key? key,
      required this.Answer,
      required this.Question,
      required this.id})
      : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

const Color Calculator_background = Color(0xFF345b82);
const appcolour = Color(0xFF003255);

class _CalculatorState extends State<Calculator> {
  @override
  void initState() {
    getUser(context).whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getUser(context).whenComplete(
        () => context,
      );
    });

    return Scaffold(
        appBar: TitleBar(),
        endDrawer: NavigationDrawer(),
        body: FutureBuilder(
          future: getUser(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData && snapshot.data != null) {
              return Row(children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 5,
                  child: InputField(
                      Calculation_type:
                          Calculation_List[widget.id].calculationname,
                      Inputtypes: Calculation_List[widget.id].inputFields,
                      calculation_id:
                          Calculation_List[widget.id].calculationID),
                ),
                Flexible(
                    fit: FlexFit.loose,
                    flex: 3,
                    child: Column(children: [
                      Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(
                                100.0, 20.0, 110.0, 40.0),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(36),
                                  topRight: Radius.circular(36),
                                  bottomLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Flexible(
                                    flex: 5,
                                    child: CalculatorScreen(
                                      answer: widget.Answer,
                                      question: widget.Question,
                                    )),
                                Flexible(
                                    fit: FlexFit.loose,
                                    flex: 6,
                                    child: calculatorui())
                              ],
                            ),
                          ))
                    ]))
              ]);
            }
            return const Center(child: Text(''));
          },
        ));
  }
}
