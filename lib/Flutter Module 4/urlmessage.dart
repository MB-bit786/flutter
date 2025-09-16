//,  Sms  urllauncher

import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

class Urll2 extends StatefulWidget {
  const Urll2({super.key});

  @override
  State<Urll2> createState() => _Urll2State();
}

class _Urll2State extends State<Urll2> {
  List<String> phonelist = ["1234553322", "9876543333", "4567892222", "7894562222", "4567892221"];
  List<String> phonename = ["John Doe", "Jane Smith", "Alice Johnson", "Bob Brown", "Charlie Davis"];

  Future<void> _launchSMS(String phoneNumber) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      // You can add query parameters for body if needed, e.g. queryParameters: {'body': 'Hello!'}
    );
    await launchUrl(smsUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS List'),
      ),
      body: ListView.builder(
        itemCount: phonelist.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                _launchSMS(phonelist[index]);
              },
              child: Column(
                children: [
                  Text("${phonename[index]}"),
                  Text("${phonelist[index]}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}