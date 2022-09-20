import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      //leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
      title: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: 'Math',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30 * MediaQuery.textScaleFactorOf(context))),
          TextSpan(
              text: 'U ',
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30 * MediaQuery.textScaleFactorOf(context),
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Similarity Index',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30 * MediaQuery.textScaleFactorOf(context))),
        ]),
      ),
      backgroundColor: const Color(0xFF003255),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(66);
}
