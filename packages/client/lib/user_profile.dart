import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool showPending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff003154),
              Color(0xfffd1f63),
              Color(0xff003154),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/planet.png'),
            fit: BoxFit.scaleDown,
            alignment: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 800,
            height: 400,
            child: Card(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${apiObj.getLocalUserID()}",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 0.15,
                        wordSpacing: 1.05,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Admin Status: ${apiObj.getIsAdmin()}",
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 0.15,
                        wordSpacing: 1.05,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showPending = true;
                            });
                          },
                          child: Text('Request Developer API Key'),
                        ),
                        SizedBox(width: 15),
                        Visibility(
                          visible: showPending,
                          child: Text(
                              "https://mathuserver.azurewebsites.net/graphql"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
