/* // This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:http/http.dart' as http;
//import 'dart:html' as html;

import 'package:client/main.dart';
import 'package:client/home.dart';
import 'package:client/search_bar.dart';
import 'package:client/nav_bar.dart';

//@required
void main() {
  testWidgets('Creates Home Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    const home = Home(history: []);

    await tester.pumpWidget(const MaterialApp(key: Key('tk'), home: home));

    //final SearchBar searchbar = const SearchBar();
    //final NavBar appbarr = const NavBar();

    // Verify that our widgets are created.
    expect(find.byWidget(home), findsOneWidget);
    //expect(find.byWidget(NavBar()), findsOneWidget);
  });

  testWidgets("Creates SearchBar component and NavBar component",
      (WidgetTester tester) async {
    List<SearchObject> results = [
      SearchObject("2x+3", 100),
      SearchObject("y-12", 100),
      SearchObject("(2x-6)/8", 100),
      SearchObject("x^2+9x+12", 100)
    ];
    List<String> history = [""];

    final SearchBar searchbar = SearchBar(results: results, history: history);
    const NavBar appbarr = NavBar();

    await tester.pumpWidget(MaterialApp(
        key: const Key('TestKey'),
        home: Scaffold(appBar: appbarr, body: searchbar)));

    expect(find.byWidget(appbarr), findsOneWidget);
    expect(find.byWidget(searchbar), findsOneWidget);
  });
}
 */

import 'package:client/logIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:client/admin_page.dart';
import 'package:client/apiInterface.dart';
import 'package:client/commentItem.dart';
import 'package:client/equationOverview.dart';
import 'package:client/history.dart';
import 'package:client/history_item.dart';
import 'package:client/home.dart';
import 'package:client/homeCarousel.dart';
import 'package:client/load_icon.dart';
import 'package:client/logIn.dart';
import 'package:client/main.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/noResultsText.dart';
import 'package:client/savedResultItem.dart';
import 'package:client/savedResults.dart';
import 'package:client/SearchResultItem.dart';
import 'package:client/sign_up.dart';
import 'package:client/string_checker.dart';
import 'package:client/titlebar.dart';
import 'package:client/UserData.dart';

void main() {
  group('Widget Creation Tests', () {
    testWidgets('Home Page Builder', (WidgetTester tester) async {
      const home = Home();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Scaffold(appBar: AppBar(), body: home),
        ),
      );

      expect(find.byWidget(home), findsOneWidget);
    });

    testWidgets('Title Bar Builder', (WidgetTester tester) async {
      const title = TitleBar();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Scaffold(
            appBar: title,
            body: Text('Hello World!'),
          ),
        ),
      );

      expect(find.byWidget(title), findsOneWidget);
    });

    testWidgets('Navigation Drawer Builder', (WidgetTester tester) async {
      const nav = NavigationDrawer();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Scaffold(
            appBar: AppBar(),
            endDrawer: nav,
            body: Text('Hello World!'),
          ),
        ),
      );

      expect(find.byWidget(nav), findsOneWidget);
    });

    testWidgets('Admin Page Builder', (WidgetTester tester) async {
      const adP = AdminPage();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: adP,
        ),
      );

      expect(find.byWidget(adP), findsOneWidget);
    });

    testWidgets('Log In Page Builder', (WidgetTester tester) async {
      const liP = LogIn();

      await tester.pumpWidget(
        MaterialApp(key: const Key('TestKey'), home: liP),
      );

      expect(find.byWidget(liP), findsOneWidget);
    });

    testWidgets('Sign Up Page Builder', (WidgetTester tester) async {
      const suP = SignUpPage();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: suP,
        ),
      );

      expect(find.byWidget(suP), findsOneWidget);
    });

    testWidgets('Equation Overview Builder', (WidgetTester tester) async {
      const String equation = '1+1';
      const int id = 1;
      const eOV = EquationOverview(equation: equation, problemID: id);

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: eOV,
        ),
      );

      expect(find.byWidget(eOV), findsOneWidget);
    });

    testWidgets('History Page Builder', (WidgetTester tester) async {
      const his = History();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: his,
        ),
      );

      expect(find.byWidget(his), findsOneWidget);
    });

    testWidgets('Saved Page Builder', (WidgetTester tester) async {
      const sav = SavedResults();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: sav,
        ),
      );

      expect(find.byWidget(sav), findsOneWidget);
    });

    testWidgets('Search Result Item Builder', (WidgetTester tester) async {
      const String equation = '1+1';
      const String conf = '99';
      const int id = 1;
      const sR =
          SearchResultItem(equation: equation, conf_score: conf, problemID: id);

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Container(
            child: sR,
          ),
        ),
      );

      expect(find.byWidget(sR), findsOneWidget);
    });

    testWidgets('History Item Builder', (WidgetTester tester) async {
      const String equation = '1+1';
      const int id = 1;
      const hI = HistoryItem(equation: equation, problemID: id);

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Container(
            child: hI,
          ),
        ),
      );

      expect(find.byWidget(hI), findsOneWidget);
    });

    testWidgets('Saved Item Builder', (WidgetTester tester) async {
      const String equation = '1+1';
      const int id = 1;
      const sI = SavedResultItem(equation: equation, problemID: id);

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Container(
            child: sI,
          ),
        ),
      );

      expect(find.byWidget(sI), findsOneWidget);
    });

    testWidgets('Load Icon Builder', (WidgetTester tester) async {
      //const Widget lI = LoadIcon();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Container(
            child: LoadIcon(),
          ),
        ),
      );

      expect(find.byWidget(LoadIcon()), findsOneWidget);
    });

    testWidgets('Comment Item Builder', (WidgetTester tester) async {
      const String comment = 'This is a test Comment!';
      const String umail = 'test@email.com';
      const cI = CommentItem(comment: comment, umail: umail);

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Container(
            child: cI,
          ),
        ),
      );

      expect(find.byWidget(cI), findsOneWidget);
    });

    testWidgets('No Results Text Builder', (WidgetTester tester) async {
      const nRT = NothingToSeeHere();

      await tester.pumpWidget(
        MaterialApp(
          key: const Key('TestKey'),
          home: Container(
            child: nRT,
          ),
        ),
      );

      expect(find.byWidget(nRT), findsOneWidget);
    });
  });
}
