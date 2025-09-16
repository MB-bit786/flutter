import 'package:flutter/material.dart';
import 'task.dart';
import 'repository.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskRepository taskRepo;
  AddTaskScreen({required this.taskRepo});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();
  String priority = "Low";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Task Name")),
            TextField(controller: descCtrl, decoration: InputDecoration(labelText: "Description")),
            TextField(controller: dateCtrl, decoration: InputDecoration(labelText: "Date (YYYY-MM-DD)")),
            TextField(controller: timeCtrl, decoration: InputDecoration(labelText: "Time (HH:MM)")),
            DropdownButton<String>(
              value: priority,
              items: ["Low", "Medium", "High"].map((p) {
                return DropdownMenuItem(value: p, child: Text(p));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  priority = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                Task task = Task(
                  name: nameCtrl.text,
                  description: descCtrl.text,
                  date: dateCtrl.text,
                  time: timeCtrl.text,
                  priority: priority,
                );
                await widget.taskRepo.insert("tasks", task.toMap());
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}