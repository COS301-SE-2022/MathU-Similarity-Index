//Imports
// ignore_for_file: non_constant_identifier_names, must_be_immutable, constant_identifier_names, file_names

import 'package:flutter/material.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class InputFieldButtons extends StatefulWidget {
  const InputFieldButtons({Key? key}) : super(key: key);

  @override
  State<InputFieldButtons> createState() => _InputFieldButtonsState();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFF0476c7);

class _InputFieldButtonsState extends State<InputFieldButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0, 0),
        child: Row(
          children: [
            TextButton(
                onPressed: null,
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
                )),
            const SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: null,
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
                ))
          ],
        ));
  }
}
