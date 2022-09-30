import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget LoadIcon() {
  return Center(
    child: Container(
      margin: EdgeInsets.all(15),
      child: SpinKitFoldingCube(
        color: Color(0xFFEC5666),
        size: 50.0,
      ),
    ),
  );
}
