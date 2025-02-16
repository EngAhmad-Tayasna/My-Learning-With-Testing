import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_learing_with_testing/list_item_page.dart';

void main() {
  testWidgets("find a deep item in a long list", (WidgetTester tester) async {
    await tester.pumpWidget(
      ListItemPage(items: List<String>.generate(1000, (i) => 'Item $i')),
    );

    Finder scrollableFinder = find.byType(Scrollable);
    Finder itemFinder = find.text('Item 400');

    await tester.scrollUntilVisible(itemFinder, 500 ,scrollable: scrollableFinder);

    expect(itemFinder, findsOneWidget);
  });
}
