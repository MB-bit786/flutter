import 'package:flutter/material.dart';
import 'package:assigsments/Flutter%20Module%204/user.dart';

class SecondScreen extends StatelessWidget {
  final int sum;

  SecondScreen({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: Center(
        child: Text(
          "Sum = $sum",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}