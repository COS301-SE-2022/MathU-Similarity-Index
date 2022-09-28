//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/noResultsText.dart';
import 'package:client/commentItem.dart';
import 'package:client/load_icon.dart';

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
      {Key? key, required this.equation, required this.problemID})
      : super(key: key);

  final String equation, problemID;

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

  checkIsSaved(String pid) async {
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
          if (savedResults[i]['equation']['id'] == pid) {
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

  checkIsComments(String pid) async {
    setState(() {
      isLoading = true;
    });

    comments = await apiObj.getComments(pid);

    setState(() {
      isLoading = false;
    });

    print("comments array status: " + comments.isNotEmpty.toString());
    print("comments array contents: ");
    print(comments);
    print("#################End of Comments##############");

    if (comments != null && comments.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();

    isLoggedIn = apiObj.getIsLoggedIn();
    isColored = await checkIsSaved(widget.problemID);
    isComments = await checkIsComments(widget.problemID);
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
                title: Text(
                  widget.equation,
                  style: TextStyle(
                    letterSpacing: 2.0,
                    wordSpacing: 4.5,
                    fontSize: 24.0,
                  ),
                ),
                subtitle: Text(
                  'Problem ID: ${widget.problemID}',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    wordSpacing: 2.5,
                  ),
                ),
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
            child: SizedBox(
              width: 800,
              child: Expanded(
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
            ),
          ),
          Visibility(
            visible: isLoggedIn,
            child: SizedBox(
              width: 800,
              child: Divider(
                height: 2,
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: LoadIcon(),
          ),
          (isComments)
              ? Expanded(
                  child: ListView.builder(
                      key: Key("TestListViewBuilder"),
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

  void saveToFavourites() {
    /*
    @TODO
    1. Create an API Object
    2. Use API Object to add equation to saved equations
    3. Change icon to be shaded in
    */

    setState(() async {
      isLoggedIn = apiObj.getIsLoggedIn();
      if (isLoggedIn) {
        isColored = !isColored;
        if (isColored) {
          saved = await apiObj.addSavedResult(widget.problemID);
        } else {
          //removed = await apiObj.removeSavedResult(widget.problemID);
        }

        isColored = checkIsSaved(widget.problemID);
      }
    });
  }

  void addComment() async {
    bool isAdded = false;

    if (newComment.isNotEmpty || newComment == '') {
      setState(() {
        isLoading = true;
      });

      dynamic temp = await apiObj.addComment(newComment, widget.problemID);

      setState(() {
        isLoading = false;
      });

      if (temp != null &&
          temp.isNotEmpty &&
          temp['success'] != null &&
          temp['success'].isNotEmpty) {
        isAdded = temp['success'];
        setState(() async {
          isComments = await checkIsComments(widget.problemID);
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
      width: 400,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1500),
      padding: EdgeInsets.all(10),
    ));
  }
}
