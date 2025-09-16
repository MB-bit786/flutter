/*Create an application to input 2 numbers from user and
all numbers between those 2 numbers in next activity*/

import 'package:flutter/material.dart';

import 'task4-1.dart';
class number extends StatefulWidget {
  const number({super.key});

  @override
  State<number> createState() => _numberState();
}

class _numberState extends State<number> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Two Numbers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _startController,
              decoration: InputDecoration(
                labelText: "Enter First Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _endController,
              decoration: InputDecoration(
                labelText: "Enter Second Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int? start = int.tryParse(_startController.text);
                int? end = int.tryParse(_endController.text);
                if (start != null && end != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NumberListScreen(start: start, end: end)),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid numbers')),
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}