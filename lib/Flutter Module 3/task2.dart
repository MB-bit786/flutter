import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Container",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.red,
            width: 500,
            height: 200,
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
          ),
        Container(
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                width: 200,
                height: 200,
                margin: EdgeInsets.all(11.0),
              ),
              Container(
                color: Colors.blue,
                width: 200,
                height: 200,
                margin: EdgeInsets.all(11.0),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                width: 200,
                height: 200,
                margin: EdgeInsets.all(11.0),
              ),
              Container(
                color: Colors.blue,
                width: 200,
                height: 200,
                margin: EdgeInsets.all(11.0),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color.fromRGBO(255, 235, 59, 1),
                width: 140,
                height: 140,
                margin: EdgeInsets.all(1.0),
              ),
                Container(
                color: Colors.yellow,
                width: 140,
                height:140,
                margin: EdgeInsets.all(2.0),
              ),
               Container(
                color: Colors.yellow,
                width: 140,
                height: 140,
                margin: EdgeInsets.all(2.0),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color.fromRGBO(255, 235, 59, 1),
                width: 140,
                height: 140,
                margin: EdgeInsets.all(1.0),
              ),
                Container(
                color: Colors.yellow,
                width: 140,
                height:140,
                margin: EdgeInsets.all(2.0),
              ),
               Container(
                color: Colors.yellow,
                width: 140,
                height: 140,
                margin: EdgeInsets.all(2.0),
              ),
            ],
          ),
        ),
        ]),
      ),
    );
  }
}

