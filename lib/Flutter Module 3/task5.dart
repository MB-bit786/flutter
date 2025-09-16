/*52. Create an application with radio buttons (Add,
Substraction, Multiply, Division) EditText (number1,
number2) and print result as per user choice from radio button in
TextView */

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _result = '';
  double _number1 = 0;
  double _number2 = 0;
  String _operation = 'Add';
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();

  void _calculate() {
    setState(() {
      _number1 = double.tryParse(_number1Controller.text) ?? 0;
      _number2 = double.tryParse(_number2Controller.text) ?? 0;

      switch (_operation) {
        case 'Add':
          _result = (_number1 + _number2).toString();
          break;
        case 'Subtract':
          _result = (_number1 - _number2).toString();
          break;
        case 'Multiply':
          _result = (_number1 * _number2).toString();
          break;
        case 'Divide':
          if (_number2 != 0) {
            _result = (_number1 / _number2).toString();
          } else {
            _result = 'Cannot divide by zero';
          }
          break;
        default:
          _result = 'Invalid operation';
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 1',
              ),
            ),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 2',
              ),
            ),
            Row(
              children: [
                Radio(
                  value: 'Add',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value!;
                    });
                  },
                ),
                Text('Add'),
                Radio(
                  value: 'Subtract',
                  groupValue: _operation,
                  onChanged: (value) {  
                    setState(() {
                      _operation = value!;
                    });
                  },
                ),
                Text('Subtract'),
                Radio(
                    value: 'Multiply',
                    groupValue: _operation,
                    onChanged: (value) {
                      setState(() {
                        _operation = value!;
                      });
                    },  
                ),
                Text('Multiply'),
                Radio(
                  value: 'Divide',
                  groupValue: _operation,
                  onChanged: (value) {
                    setState(() {
                      _operation = value!;
                    });
                  },
                ),
                Text('Divide'),
              ],
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 18),
            ),
          ],  
        ),
      ),
    );
  }
}