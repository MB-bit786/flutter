/*Write a code to display alert dialog with positive,
negative and neutral button and display toast
respectively user's choice */

import 'package:flutter/material.dart';
class Alert2 extends StatefulWidget {
  const Alert2({super.key});

  @override
  State<Alert2> createState() => _Alert2State();
}

class _Alert2State extends State<Alert2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Multiple Buttons'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Choose an Option'),
                  content: const Text('Please select one of the options below.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Positive button pressed')),
                        );
                      },
                      child: const Text('Positive'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Negative button pressed')),
                        );
                      },
                      child: const Text('Negative'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Neutral button pressed')),
                        );
                      },
                      child: const Text('Neutral'),
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