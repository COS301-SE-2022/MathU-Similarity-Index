import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeFont = 0;

    if (MediaQuery.of(context).size.width > 600) {
      sizeFont = 58.0;
    } else if (MediaQuery.of(context).size.width < 600 &&
        MediaQuery.of(context).size.width < 450) {
      sizeFont = 32.0;
    } else {
      sizeFont = 24.0;
    }

    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: true,
      //leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
      title: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: 'Math',
            style: TextStyle(
              color: Colors.white,
              fontSize: sizeFont,
            ),
          ),
          TextSpan(
              text: 'U ',
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: sizeFont,
                  fontWeight: FontWeight.bold)),
          TextSpan(
            text: 'Similarity Index',
            style: TextStyle(
              color: Colors.white,
              fontSize: sizeFont,
            ),
          ),
        ]),
      ),
      backgroundColor: const Color(0xFF003255),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(66);
}
