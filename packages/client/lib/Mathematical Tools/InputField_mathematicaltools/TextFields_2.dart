//Imports
// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names, file_names, use_build_context_synchronously, depend_on_referenced_packages

import 'package:client/Mathematical%20Tools/MathematicalTools.dart';
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:http/http.dart' as http;
import 'package:client/Mathematical Tools/calculator.dart';

import '../calculator.dart';
import '../calculatorui.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class TextFields_2 extends StatefulWidget {
  var Inputtypes;
  final int calculation_id;
  TextFields_2(
      {Key? key, required this.Inputtypes, required this.calculation_id})
      : super(key: key);

  @override
  State<TextFields_2> createState() => _TextFields_2State();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFFE63946);

class _TextFields_2State extends State<TextFields_2> {
  late String textinput1;
  late String textinput2;
  late String finaltextinput;
  final MathFieldEditingController textController1 =
      MathFieldEditingController();
  final MathFieldEditingController textController2 =
      MathFieldEditingController();
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 720;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 720;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: MathField(
                    // No parameters are required.

                    keyboardType: MathKeyboardType.expression,
                    variables: const ['x', 'y', 'z', '='],
                    decoration: InputDecoration(
                      hintText: "${widget.Inputtypes[0]} *",
                      labelText: widget.Inputtypes[0],
                      labelStyle: const TextStyle(
                        color: Calculator_background,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Calculator_background)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Calculator_background)),
                    ),
                    controller: textController1,
                    onChanged: (value) {
                      try {
                        textinput1 = '${TeXParser(value).parse()}';
                      } catch (_) {
                        textinput1 = 'invalid input';
                      }
                    },
                  ),
                )),
            Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: MathField(
                    // No parameters are required.

                    keyboardType: MathKeyboardType.expression,
                    variables: const ['x', 'y', 'z', '='],
                    decoration: InputDecoration(
                      hintText: "${widget.Inputtypes[1]} *",
                      labelText: widget.Inputtypes[1],
                      labelStyle: const TextStyle(
                        color: Calculator_background,
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Calculator_background)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Calculator_background)),
                    ),
                    controller: textController2,
                    onChanged: (value) {
                      try {
                        textinput2 = '${TeXParser(value).parse()}';
                      } catch (_) {
                        textinput2 = 'invalid input';
                      }
                    },
                  ),
                )),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0, 0),
                  child: Row(
                    children: [
                      Flexible(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MathematicalTools()));
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
                                    'Change Calculation',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ))),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: TextButton(
                              onPressed: () async {
                                finaltextinput = "$textinput1,$textinput2";
                                final url =
                                    'https://mathuserver.azurewebsites.net/api/${widget.calculation_id}/?query=$finaltextinput';

                                final response = await http.get(Uri.parse(url));
                                final splitted =
                                    response.body.split('separator');
                                if (isDesktop(context)) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Calculator(
                                              Answer: splitted[1],
                                              Question: splitted[0],
                                              id: widget.calculation_id,
                                            )),
                                  );
                                }
                                if (isMobile(context)) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0.065 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              0.075 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              0.065 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height,
                                              0.065 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height),
                                          child: calculatorui(
                                            Answer: splitted[1],
                                            Question: splitted[0],
                                          ));
                                    },
                                  );
                                }
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
                                    'Calculate',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ))),
                    ],
                  )),
            )
          ],
        ));
  }
}
