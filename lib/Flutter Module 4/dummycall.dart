/*create a Phone call App when user first time open the
app it will automatically generate one dialog which has
two option allow, deny if click on allow permission is grant
in settings*/
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Dummycall extends StatefulWidget {
  const Dummycall({super.key});

  @override
  State<Dummycall> createState() => _DummycallState();
}

class _DummycallState extends State<Dummycall> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy call"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () async {
            var status = await Permission.phone.request();
            if (status.isGranted) {
              print("permission is granted");
            } else {
              print("permission is not granted");
            }
          }, child: Text("Call")),
        ],
      ),
    );
  }
}