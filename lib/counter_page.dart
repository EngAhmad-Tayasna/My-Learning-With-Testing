import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  num result = 0;

  TextEditingController controller = TextEditingController();

  void calculateTheSquare() {
    num numberInput = num.parse(controller.text.trim());
    setState(() {
      result = numberInput * numberInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
            ),
            Text("$result", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTheSquare,
              child: const Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
