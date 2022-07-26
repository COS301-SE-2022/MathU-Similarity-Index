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

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:client/main.dart';
import 'package:client/home.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/titlebar.dart';
import 'package:client/SearchResultItem.dart';
import 'package:client/apiInterface.dart';

void main() {
  testWidgets('Builds the home screen of the app', (WidgetTester tester) async {
    const home = Home();
    const drawer = NavigationDrawer();
    const appBar = TitleBar();
    final api = API_Interface();

    await tester.pumpWidget(MaterialApp(
      key: const Key('TestApp'),
      home: home,
    ));

    await tester.tap(find.byKey(Key('TestTap')));

    await tester.pumpAndSettle();

    expect(
        find.descendant(
            of: find.byKey(Key("TestListViewBuilder")),
            matching: find
                .byWidget(SearchResultItem(equation: "3-2", conf_score: "0"))),
        findsWidgets);
  });
}
