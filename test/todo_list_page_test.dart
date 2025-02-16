import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_learing_with_testing/todo_list_page.dart';

void main() {

  testWidgets("Add and Remove a todo", (WidgetTester tester) async {


    // Add todo list
    await tester.pumpWidget(const TodoListPage());

    await tester.enterText(find.byType(TextField),"Hello");

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pumpAndSettle();

    expect(find.byKey(Key("Hello0")), findsOneWidget);
    // Or
    expect(find.text("Hello"), findsOneWidget);

    // Remove todo list

    await tester.drag(find.byKey(Key("Hello0")), Offset(500, 0)); 

    await tester.pumpAndSettle();
    expect(find.byKey(Key("Hello0")),findsNothing);
  });
}
