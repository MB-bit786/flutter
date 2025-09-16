/* Write a program you have taken three seek bar controls.
From three Slider which slider value changed the
background color of device will be changed. */

import 'package:flutter/material.dart';

class sildercolor extends StatefulWidget {
  const sildercolor({super.key});

  @override
  State<sildercolor> createState() => _sildercolorState();
}

class _sildercolorState extends State<sildercolor> {
  double _sliderValue = 0.5; // Initial value for the slider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Column(
        children: [
          Slider(
            value: _sliderValue,
            min: 0,
            max: 1,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          Container(
            height: 200,
            width: 200,
            color: Color.fromRGBO(
              (_sliderValue * 255).toInt(),
              (_sliderValue * 255).toInt(),
              (_sliderValue * 255).toInt(),
              1,
            ),
            child: Center(
              child: Text(
                'Slider Value: ${(_sliderValue * 100).toInt()}%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}