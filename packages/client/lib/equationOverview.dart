//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/noResultsText.dart';
import 'package:client/commentItem.dart';
import 'package:client/load_icon.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';

/*
NOTE
################################################################################
This will serve as the final destination for the user's journey for an equation.
This page will show all comments related to an equation, and provide a means for
the user to add to the comments.
################################################################################
*/

//Code
class EquationOverview extends StatefulWidget {
  const EquationOverview(
      {Key? key,
      required this.equation,
      required this.problemID,
      required this.isSaved})
      : super(key: key);

  final String equation;
  final int problemID;
  final bool isSaved;

  @override
  State<EquationOverview> createState() => _EquationOverviewState();
}

class _EquationOverviewState extends State<EquationOverview> {
  bool isColored = false;
  bool saved = false;
  bool removed = false;
  bool isComments = false;
  bool isLoading = false;
  bool isLoggedIn = false;
  List<dynamic> comments = [];

  checkIsSaved(int pid) async {
    if (isLoggedIn) {
      setState(() {
        isLoading = true;
      });

      List<dynamic> savedResults = await apiObj.getSavedResults();

      setState(() {
        isLoading = false;
      });

      if (savedResults != null && savedResults.isNotEmpty) {
        for (int i = 0; i < savedResults.length; i++) {
          if (savedResults[i]['id'] == pid) {
            return true;
          }
        }
        return false;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  checkIsComments(int pid) async {
    setState(() {
      isLoading = true;
    });

    comments = await apiObj.getComments(pid);

    setState(() {
      isLoading = false;
    });

    if (comments != null && comments.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isColored = widget.isSaved;
    isComments = checkIsComments(widget.problemID);
  }

  final TextEditingController commentController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    commentController.dispose();
    super.dispose();
  }

  String newComment = '';

  @override
  Widget build(BuildContext context) {
    isLoggedIn = apiObj.getIsLoggedIn();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: ListTile(
                title: Math.tex(
                  widget.equation,
                  textStyle: TextStyle(fontSize: 24),
                ),
                /* subtitle: Text(
                  'Problem ID: ${widget.problemID}',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    wordSpacing: 2.5,
                  ),
                ), */
                leading: (isLoggedIn)
                    ? IconButton(
                        onPressed: saveToFavourites,
                        icon: (isColored)
                            ? Icon(Icons.star, color: Colors.amberAccent)
                            : Icon(Icons.star_border_outlined),
                      )
                    : null,
              ),
            ),
          ),
          Visibility(
            visible: isLoggedIn,
            child: Card(
              margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: ListTile(
                  title: TextFormField(
                    controller: commentController,
                    onChanged: (value) {
                      newComment = value;
                    },
                    onFieldSubmitted: (value) {
                      addComment();
                    },
                    decoration: InputDecoration(
                      hintText: "Comment...",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          commentController.clear();
                        },
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.add_comment_outlined),
                    onPressed: addComment,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Visibility(
              visible: isLoggedIn,
              child: Divider(
                height: 6,
                indent: 50,
                endIndent: 50,
              )),
          Visibility(
            visible: isLoading,
            child: LoadIcon(),
          ),
          (isComments)
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: comments.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return CommentItem(
                          comment: comments[index]['comment'],
                          umail: comments[index]['useremail'],
                        );
                      }),
                )
              : NothingToSeeHere(),
        ],
      ),
    );
  }

  void saveToFavourites() async {
    bool tempSaved = await apiObj.addSavedResult(widget.problemID);
    bool tempRemoved = await apiObj.removeSavedResult(widget.problemID);

    setState(() {
      isLoggedIn = apiObj.getIsLoggedIn();
      if (isLoggedIn) {
        isColored = !isColored;
        if (isColored) {
          saved = tempSaved;
          removed = false;
        } else {
          removed = tempRemoved;
          saved = false;
        }
      }
    });

    if (saved) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Yay! Saved Successfully"),
        width: 270,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        padding: EdgeInsets.all(10),
      ));
    } else if (removed) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Yay! Removed Successfully"),
        width: 270,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        padding: EdgeInsets.all(10),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Woops, Something Went Wrong..."),
        width: 270,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        padding: EdgeInsets.all(10),
      ));
    }
  }

  void addComment() async {
    bool isAdded = false;

    if (newComment.isNotEmpty || newComment != '') {
      setState(() {
        isLoading = true;
      });

      dynamic temp = await apiObj.addComment(newComment, widget.problemID);

      setState(() {
        isLoading = false;
      });

      if (temp != null && !temp.isEmpty && temp['success'] != null) {
        isAdded = temp['success'];
        setState(() async {
          isComments = await checkIsComments(widget.problemID);
          commentController.clear();
        });
      } else {
        isAdded = false;
      }
    } else {
      isAdded = false;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: (isAdded)
          ? Text('Yay! Comment Added Successfully')
          : Text('Woops, Something went wrong...'),
      width: 270,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1500),
      padding: EdgeInsets.all(10),
    ));
  }
}



/*

SizedBox(
  width: 800,
  height: 200,
  child: TextFormField(
    maxLines: 3,
    controller: commentController,
    onChanged: (value) {
      newComment = value;
    },
    onFieldSubmitted: (value) {
      addComment();
    },
    decoration: InputDecoration(
      hintText: "Add a comment...",
      suffixIcon: IconButton(
        icon: Icon(Icons.add_comment_outlined),
          onPressed: addComment,
        ),
     ),
  ),
),

*/