/*Write a code to display profile and logout option in options
menu
*/
import 'package:flutter/material.dart';
import 'package:assigsments/Flutter Module 3/task12.dart';
import 'profile.dart';

class MenuExample extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Example'),
      ),
      body: Center(
        child: PopupMenuButton(
          onSelected: (value) {
            if (value == 'Profile') {
              // Navigate to Profile Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            } else if (value == 'Logout') {
              // Handle Logout
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Logged out successfully")),
              );
            }
          },
          itemBuilder: (BuildContext context) {
            return {'Profile', 'Logout'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
