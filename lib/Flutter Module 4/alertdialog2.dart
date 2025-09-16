//open alert dialog when user want to exit from the application

import 'package:flutter/material.dart';

class Alertdialog2 extends StatefulWidget {
  const Alertdialog2({super.key});

  @override
  State<Alertdialog2> createState() => _Alertdialog2State();
}

class _Alertdialog2State extends State<Alertdialog2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog on Exit'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Confirm Exit'),
                  content: const Text('Are you sure you want to exit the app?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Add your exit logic here
                      },
                      child: const Text('Exit'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Exit App'),
        ),
      ),
    );
  }
}
