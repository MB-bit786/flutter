/*Write a code to display alert dialog with list of cities
and Single choice selection display selected city in
TextView */

import 'package:flutter/material.dart';
class Alertdialog extends StatefulWidget {
  const Alertdialog({super.key});

  @override
  State<Alertdialog> createState() => _AlertdialogState();
}

class _AlertdialogState extends State<Alertdialog> {
  String? _selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showCityDialog();
          },
          child: const Text('Select City'),
        ),
      ),
    );
  }

  void _showCityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a City'),
          content: SingleChildScrollView(
            child: ListBody(
                children: [
                RadioListTile(
                  title: Text('New York'),
                  value: 'New York',
                  groupValue: _selectedCity,
                  onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                  Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text('Los Angeles'),
                  value: 'Los Angeles',
                  groupValue: _selectedCity,
                  onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                  Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text('Chicago'),
                  value: 'Chicago',
                  groupValue: _selectedCity,
                  onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                  Navigator.of(context).pop();
                  },
                ),
                ]
            ),
          ),
        );
      },
    );
  }
}