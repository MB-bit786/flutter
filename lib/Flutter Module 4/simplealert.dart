/*Write a code to display simple alert dialog with title,
description and icon when button is clicked*/

import 'package:flutter/material.dart';
class Simplealert extends StatefulWidget {
  const Simplealert({super.key});

  @override
  State<Simplealert> createState() => _SimplealertState();
}

class _SimplealertState extends State<Simplealert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Alert Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Alert Dialog Title'),
                  content: const Text('This is the alert dialog description.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Show Alert Dialog'),
        ),
      ),
    );
  }
}