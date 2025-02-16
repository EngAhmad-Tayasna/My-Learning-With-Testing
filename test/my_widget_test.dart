import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_learing_with_testing/main.dart';

void main() {
  group("Find Widget by type, key and instants", () {
    testWidgets("My Widget has a title and message", (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MyWidget(title: "T", message: "M"));

      Finder titleFinder = find.text("T");
      Finder messageFinder = find.text("M");

      expect(titleFinder, findsOneWidget);
      expect(messageFinder, findsOneWidget);
    });

    testWidgets("Find Widget By Key", (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: "T", message: "M"));

      Finder appBarFinder = find.byKey(Key('AppBar'));
      expect(appBarFinder, findsOneWidget);
    });

    testWidgets("Find Widget By Type", (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: "T", message: "M"));

      Finder centerFinder = find.byType(Center);
      expect(centerFinder, findsOneWidget);
    });

    testWidgets("Find Widget By instances", (WidgetTester tester) async {
      Widget icon = Icon(Icons.done);
      await tester.pumpWidget(MyWidget(title: "T", message: "M", icon: icon));

      Finder iconFinder = find.byWidget(icon);
      expect(iconFinder, findsOneWidget);
    });

    testWidgets("Find AppBar With Title", (WidgetTester tester) async {
      await tester.pumpWidget(MyWidget(title: "T", message: "M"));

      Finder appBarFinder = find.byKey(Key('AppBar'));
      expect(appBarFinder, findsOneWidget);

      Finder appBarHasTitle = find.descendant(
        of: appBarFinder,
        matching: find.text("T"),
      );
      expect(appBarHasTitle, findsOneWidget);
    });
  });
}
