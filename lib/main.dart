import 'package:assigsments/Flutter%20Module%204/alert2.dart';
import 'package:assigsments/Flutter%20Module%204/simplealert.dart';
import 'package:assigsments/Flutter%20Module%203/task10.dart';
import 'package:assigsments/Flutter%20Module%203/task11.dart';
import 'package:assigsments/Flutter%20Module%203/task12.dart';
import 'package:assigsments/Flutter%20Module%203/task7.dart';
import 'package:assigsments/Flutter%20Module%203/task8.dart';
import 'package:assigsments/Flutter%20Module%203/task9.dart';
import 'package:assigsments/Flutter%20Module%204/urlmessage.dart';
import 'package:assigsments/Flutter%20Module%204/useradd.dart';
import 'package:assigsments/offline_database/task_list.dart';
import 'package:flutter/material.dart';
import 'Flutter Module 3/task1.dart';
import 'Flutter Module 3/task2.dart';
import 'Flutter Module 3/task3.dart';
import 'Flutter Module 3/task4.dart';
import 'Flutter Module 3/task5.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskList(),
    );
  }
}

