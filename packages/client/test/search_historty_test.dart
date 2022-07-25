import 'package:flutter_test/flutter_test.dart';
import 'package:client/nav_bar.dart';
import 'package:client/main.dart';
import 'package:client/home.dart';
import 'package:client/search_bar.dart';
import 'package:client/searchhistory.dart';

void main() {
  test("search history function test check if it gets called", () async {
    var testlist = new List.empty();

    //  var final = SearchHistory(testlist);
    var historyList = <String>[];
    SearchHistory(historyList);

    expect(historyList, testlist);
  });
}
