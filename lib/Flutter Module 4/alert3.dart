/*Write a code to display alert dialog with list of cities
and Single choice selection display selected city in
TextView */

import 'package:flutter/material.dart';

class Alert3 extends StatefulWidget {
  const Alert3({super.key});

  @override
  State<Alert3> createState() => _Alert3State();
}

class _Alert3State extends State<Alert3> {
  String selectedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with City Selection'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Select a City'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        RadioListTile(
                          title: const Text('New York'),
                          value: 'New York',
                          groupValue: selectedCity,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCity = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Los Angeles'),
                          value: 'Los Angeles',
                          groupValue: selectedCity,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCity = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          title: const Text('Chicago'),
                          value: 'Chicago',
                          groupValue: selectedCity,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCity = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {});
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
