/*55. create an application to display Textview when checkbox
is checked and hide otherwise */

import 'package:flutter/material.dart';
class hideshow extends StatefulWidget {
  const hideshow({super.key});

  @override
  State<hideshow> createState() => _hideshowState();
}

class _hideshowState extends State<hideshow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hide and Show Text'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            if (isChecked) 
            Text('Text is visible',style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}