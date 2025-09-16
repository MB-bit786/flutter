/*Create an application to take input number from user
and print its reverse number in TextField*/

import 'package:flutter/material.dart';

class Task3 extends StatefulWidget {
  const Task3({super.key});

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
    String _reverseNumber = '';

  String _reverse(String input) {
    String reversed = '';
    for (int i = input.length - 1; i >= 0; i--) {
      reversed += input[i];
    }
    return reversed;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reverse Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number',
              ),
              onChanged: (value) {
                setState(() {
                  _reverseNumber = _reverse(value);
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Reversed Number: $_reverseNumber',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

