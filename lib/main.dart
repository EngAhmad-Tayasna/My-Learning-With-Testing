// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget(title: 'Test Widget App', message: "Center message"));
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
    this.icon,
  });
  final String title;
  final String message;
  final Widget? icon;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title), key: Key('AppBar')),
        body: Center(child: Row(
          children: [
            Text(message),
            icon ?? SizedBox() ,
          ],
        )),
      ),
    );
  }
}
