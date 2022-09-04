// ignore_for_file: file_names
//Imports
import 'package:flutter/material.dart';
/*
NOTE
################################################################################
################################################################################
*/

//Code
class NumberKeys extends StatefulWidget {
  const NumberKeys({Key? key}) : super(key: key);

  @override
  State<NumberKeys> createState() => _NumberKeysState();
}

class _NumberKeysState extends State<NumberKeys> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 10,
      child: Row(
        children: <Widget>[
          Flexible(
              child: Column(
            children: const <Widget>[
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('7', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('4', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('1', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('0', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
            ],
          )),
          const SizedBox(
            height: 3,
            width: 2,
          ),
          Flexible(
              child: Column(
            children: const <Widget>[
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('8', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('5', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('2', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('.', style: TextStyle(fontSize: 15)),
              )),
            ],
          )),
          const SizedBox(
            height: 3,
            width: 2,
          ),
          Flexible(
              child: Column(
            children: const <Widget>[
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('9', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('6', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('3', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('x10', style: TextStyle(fontSize: 9.5)),
              )),
            ],
          )),
          const SizedBox(
            height: 3,
            width: 2,
          ),
          Flexible(
              child: Column(
            children: const <Widget>[
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('DEL', style: TextStyle(fontSize: 9)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('×', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('+', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('Ans', style: TextStyle(fontSize: 9)),
              )),
            ],
          )),
          const SizedBox(
            height: 3,
            width: 2,
          ),
          Flexible(
              child: Column(
            children: const <Widget>[
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('AC', style: TextStyle(fontSize: 12)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('÷', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('-', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
              Flexible(
                  child: ElevatedButton(
                onPressed: null,
                child: Text('=', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(
                height: 3,
                width: 2,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
