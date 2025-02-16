import 'package:flutter_test/flutter_test.dart';
import 'package:my_learing_with_testing/main.dart';

void main() {

testWidgets("My Widget has a title and message", (WidgetTester tester) async {

  await tester.pumpWidget(MyWidget(title: "T", message: "M"));

  Finder titleFinder = find.text("T");
  Finder messageFinder = find.text("M");

  expect(titleFinder, findsOneWidget);
  expect(messageFinder, findsOneWidget);

});

}