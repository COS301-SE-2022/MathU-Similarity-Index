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

  group('Integration Test', () {
    group('API Status Check', () async {
      String temp = await apiObj.getAPIStatus();
      expect(temp, 'API is Running');
    });

    group('Search Function Check', () async {
      List<dynamic> temp = await apiObj.getSimilaritySearch('1+1=2', []);
      expect(temp[0]['equation']['latex'], '1+1=2');
    });

    group('Log In Check', () async {
      dynamic temp = await apiObj.authenticateLogin('test@email.com', '1234');
      expect(temp['success'], true);
    });
  });
}
