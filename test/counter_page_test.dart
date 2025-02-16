import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_learing_with_testing/counter_page.dart';

void main() {
  testWidgets("Counter Increment Press Test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));

    Finder textZero = find.text("0");
    Finder btn = find.byType(ElevatedButton);
    Finder textField = find.byType(TextField);

    expect(textZero, findsOneWidget);
    expect(btn, findsOneWidget);
    expect(textField, findsOneWidget);

    num input = 5;
    num result = input * input;

    await tester.enterText(textField, "$input");
    await tester.tap(btn);
    await tester.pumpAndSettle();

    Finder textResult = find.text("$result");

    expect(textResult, findsOneWidget);
    expect(textZero, findsNothing);
  });
}
