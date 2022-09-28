// ignore_for_file: constant_identifier_names, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'calculatorui.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'InputField_mathematicaltools/InputField.dart';

import 'package:client/NavigationDrawer.dart';

var Calculation_List;

Future<List<dynamic>> getUser(BuildContext context) async {
  List<dynamic> GetCalculations = await apiObj.getMathsCalculations();
  Calculation_List = GetCalculations;
  print(GetCalculations[0]['calculationname']);
  return GetCalculations;
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
                      Calculation_type: Calculation_List[widget.id]
                          ['calculationname'],
                      Inputtypes: Calculation_List[widget.id]['inputfields'],
                      calculation_id: Calculation_List[widget.id]
                          ['calculationid']),
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
