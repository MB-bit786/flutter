/*53. create an application to change background when button is
clicked */
import 'package:flutter/material.dart';

class Threebutton extends StatefulWidget {
  const Threebutton({super.key});

  @override
  State<Threebutton> createState() => _ThreebuttonState();
}

class _ThreebuttonState extends State<Threebutton> {
  Color bgcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text("Three Button"),
        backgroundColor: const Color.fromARGB(255, 170, 219, 226),
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgcolor = Colors.red;
                  });
                },
                child: Text("RED"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: ElevatedButton(
                onPressed: () {setState(() {
                    bgcolor = Colors.yellow;
                  });},
                child: Text("Yellow"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                   setState(() {
                    bgcolor = Colors.green;
                  });
                },
                child: Text("Green"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}