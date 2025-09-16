/*Write a program to add name from the text view and
insert into the listview. If you click on the listview then
name should be show in the dialog box. When user press
for 2 seconds on particular List item then open Context
Menu (Delete Item, Edit Item, Exit). If user click on
Delete Item then Open one Alert Dialog with message
(“Are you sure want to delete Item?”) and yes, no button if
user press yes button then remove item from list. (Click a
DELETE button, it gives a confirm box) If user click on Edit
item then selected item display on EditText and again user
click on button then this (updated item) should be replace
with old item*/


import 'package:flutter/material.dart';
class NameListScreen extends StatefulWidget {
  @override
  State<NameListScreen> createState() => _NameListScreenState();
}

class _NameListScreenState extends State<NameListScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> names = [];
  int? editIndex; // to track editing item

  // Add or Update item
  void _addOrUpdateName() {
    String name = _controller.text.trim();
    if (name.isEmpty) return;

    setState(() {
      if (editIndex == null) {
        names.add(name); // Add new
      } else {
        names[editIndex!] = name; // Update
        editIndex = null;
      }
    });

    _controller.clear();
  }

  // Show item in dialog
  void _showNameDialog(String name) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Selected Name"),
        content: Text(name),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("OK"))
        ],
      ),
    );
  }

  // Show context menu
  void _showContextMenu(int index) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit"),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                _controller.text = names[index];
                editIndex = index;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Delete"),
            onTap: () {
              Navigator.pop(context);
              _confirmDelete(index);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Exit"),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Confirm before deleting
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure want to delete Item?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text("No")),
          TextButton(
              onPressed: () {
                setState(() {
                  names.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text("Yes")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView Example")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Name",
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addOrUpdateName,
                  child: Text(editIndex == null ? "Add" : "Update"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showNameDialog(names[index]),
                    onLongPress: () => _showContextMenu(index),
                    child: Card(
                      child: ListTile(
                        title: Text(names[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}