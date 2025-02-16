import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final appTitle = "Todo List";
   static final todo = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: Text(appTitle)),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(controller: controller),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todo.length,
                itemBuilder: (context, index) {
                  final currentTodo = todo[index];
                  return Dismissible(
                    key: Key('$currentTodo$index'),
                    onDismissed: (direction) => todo.removeAt(index),
                    background: Container(color: Colors.red),
                    child: ListTile(title: Text(currentTodo )),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todo.add(controller.text);
              controller.clear();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
