/*Create an Application to take input two numbers from
users and when user press button then display sum of
those values of next Activity. */
import 'package:flutter/material.dart';
import 'sumactivtiy.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Numbers")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter First Number"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter Second Number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int number1 = int.tryParse(num1Controller.text) ?? 0;
                int number2 = int.tryParse(num2Controller.text) ?? 0;
                int sum = number1 + number2;

                // Navigate to next screen with sum
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(sum: sum),
                  ),
                );
              },
              child: Text("Calculate Sum"),
            ),
          ],
        ),
      ),
    );
  }
}