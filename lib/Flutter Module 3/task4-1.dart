import 'package:flutter/material.dart';
import 'task4.dart';

class NumberListScreen extends StatelessWidget {
  final int start;
  final int end;

  const NumberListScreen({Key? key, required this.start, required this.end}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Numbers List"),
      ),
      body: ListView.builder(
        itemCount: end - start + 1,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${start + index}"),
          );
        },
      ),
    );
  }
}