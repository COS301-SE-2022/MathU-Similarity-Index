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
        text: const TextSpan(children: <TextSpan>[
          TextSpan(
              text: 'Math',
              style: TextStyle(color: Colors.white, fontSize: 36.0)),
          TextSpan(
              text: 'U ',
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'Similarity Index',
              style: TextStyle(color: Colors.white, fontSize: 36.0)),
        ]),
      ),
      backgroundColor: const Color(0xFF003255),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(66);
}
