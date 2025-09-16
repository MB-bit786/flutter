/*54. create an application to increate font size when plus
button click and decrease when minus button click */

import 'package:flutter/material.dart';
class fontsize extends StatefulWidget {
  const fontsize({super.key});

  @override
  State<fontsize> createState() => _fontsizeState();
}

class _fontsizeState extends State<fontsize> {
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Adjuster'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Adjust the font size',
              style: TextStyle(fontSize: _fontSize),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_fontSize > 10) {
                        _fontSize -= 2;
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _fontSize += 2;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
     );
  }
}