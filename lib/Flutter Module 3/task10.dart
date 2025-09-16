/*Write a program in android display screen color which the
Color will be select from the radio button. */

import 'package:flutter/material.dart';

class radiocolor extends StatefulWidget {
  const radiocolor({super.key});

  @override
  State<radiocolor> createState() => _radiocolorState();
}

class _radiocolorState extends State<radiocolor> {
  Color? _color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button'),
      ),
      body:
       Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Red'),
              leading: Radio<Color>(
                value: Colors.red,
                groupValue: _color,
                onChanged: (Color? value) {
                  setState(() {
                    _color = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Green'),
              leading: Radio<Color>(
                value: Colors.green,
                groupValue: _color,
                onChanged: (Color? value) {
                  setState(() {
                    _color = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Blue'),
              leading: Radio<Color>(
                value: Colors.blue,
                groupValue: _color,
                onChanged: (Color? value) {
                  setState(() {
                    _color = value;
                  });
                },
              ),
            ),
            Container(
              width: 300,
              height: 300,
              color: _color,
            ),
          ],
      ),
    );
  }
}
