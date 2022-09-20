// ignore_for_file: constant_identifier_names, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'calculatorui.dart';
import 'package:client/titlebar.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;

    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 720;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 720;
    return Scaffold(
        appBar: TitleBar(),
        endDrawer: NavigationDrawer(),
        body: FutureBuilder(
          future: getUser(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
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
                if (isDesktop(context))
                  SizedBox(
                    width: 30,
                  ),
                if (isDesktop(context))
                  calculatorui(
                      Answer: widget.Answer, Question: widget.Question),
              ]);
            }
            return const Center(child: Text(''));
          },
        ));
  }
}
