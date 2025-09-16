/*Write a program to show four images around Textview. */
import 'package:flutter/material.dart';
class images extends StatefulWidget {
  const images({super.key});

  @override
  State<images> createState() => _imagesState();
}

class _imagesState extends State<images> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Four Images Around TextView', style: TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/WhatsApp Image 2025-06-17 at 18.57.04.jpeg', width: 200, height: 200),
                Image.asset('assets/images/WhatsApp Image 2025-06-17 at 19.00.01.jpeg', width: 200, height: 200),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/WhatsApp Image 2025-06-17 at 19.03.43.jpeg', width: 200, height: 200),
                Image.asset('assets/images/WhatsApp Image 2025-06-17 at 19.06.17.jpeg', width: 200, height: 200),
              ],
            ),
          ],
        ),
      ),
    );
  }
}