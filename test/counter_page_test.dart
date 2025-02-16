import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_learing_with_testing/counter_page.dart';

void main() {
  testWidgets("Counter Increment Press Test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    Finder textZero = find.text("0");
    Finder btn = find.byType(ElevatedButton);

    expect(textZero, findsOneWidget);
    expect(btn, findsOneWidget);

    await tester.tap(btn);
    await tester.pumpAndSettle();

    Finder textOne = find.text("1");
    expect(textOne, findsOneWidget);
    expect(textZero, findsNothing);
  });
}
