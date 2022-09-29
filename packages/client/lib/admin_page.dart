//IMPORTS
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/load_icon.dart';

/*
NOTE
################################################################################
This page allows admins to create new problems, delete users, and comments,
and other admin related issues.
################################################################################
*/

//CODE
class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool autoCaching = false;
  bool isLoading = false;

  void checkServerSettings() async {
    setState(() {
      isLoading = true;
    });
    dynamic temp = await apiObj.getServerSettings();
    setState(() {
      isLoading = false;
      autoCaching = temp['autocaching'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkServerSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: isLoading,
                child: LoadIcon(),
              ),
              SizedBox(
                width: 800,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(7.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Auto Caching"),
                        SizedBox(width: 15),
                        Switch(
                          value: autoCaching,
                          activeColor: Color.fromRGBO(236, 64, 122, 1),
                          activeTrackColor: Color.fromRGBO(236, 64, 122, 1),
                          inactiveTrackColor: Color(0xFF003255),
                          onChanged: (val) {
                            setState(() => autoCaching = val);
                          },
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                                    ((states) => 0)),
                            backgroundColor:
                                MaterialStateProperty.resolveWith(getColor),
                          ),
                          child: Text('Confirm'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Making Changes?'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'We need your password to approve this action'),
                                      TextFormField(
                                        obscureText: true,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 800,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(7.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Delete User"),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            decoration:
                                InputDecoration(hintText: "johnDoe@email.com"),
                          ),
                        ),
                        SizedBox(width: 15),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                                    ((states) => 0)),
                            backgroundColor:
                                MaterialStateProperty.resolveWith(getColor),
                          ),
                          child: Text('Confirm'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Making Changes?'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'We need your password to approve this action'),
                                      TextFormField(
                                        obscureText: true,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 800,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(7.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Make Admin"),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            decoration:
                                InputDecoration(hintText: "johnDoe@email.com"),
                          ),
                        ),
                        SizedBox(width: 15),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
                                    ((states) => 0)),
                            backgroundColor:
                                MaterialStateProperty.resolveWith(getColor),
                          ),
                          child: Text('Confirm'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Making Changes?'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                          'We need your password to approve this action'),
                                      TextFormField(
                                        obscureText: true,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setAutoCaching(String pw) async {
    dynamic temp = await apiObj.setServerSettings(autoCaching, pw);

    checkServerSettings();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: (temp['success'])
          ? Text('Change Recorded')
          : Text('Woops, Something went wrong...'),
      width: 400,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1500),
      padding: EdgeInsets.all(10),
    ));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromRGBO(236, 64, 122, 1);
    }
    return Color(0xFF003255);
  }
}
