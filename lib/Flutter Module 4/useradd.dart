import 'package:flutter/material.dart';

class UserAddScreen extends StatefulWidget {
  @override
  _UserAddScreenState createState() => _UserAddScreenState();
}

class _UserAddScreenState extends State<UserAddScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _names = [];
  int? _editingIndex;

  void _addOrUpdateName() {
    String name = _controller.text.trim();
    if (name.isEmpty) return;
    setState(() {
      if (_editingIndex == null) {
        _names.add(name);
      } else {
        _names[_editingIndex!] = name;
        _editingIndex = null;
      }
      _controller.clear();
    });
  }

  void _showNameDialog(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Selected Name'),
        content: Text(name),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showContextMenu(int index) async {
    String? action = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Item'),
            onTap: () => Navigator.pop(context, 'delete'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Item'),
            onTap: () => Navigator.pop(context, 'edit'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => Navigator.pop(context, 'exit'),
          ),
        ],
      ),
    );
    if (action == 'delete') {
      _showDeleteDialog(index);
    } else if (action == 'edit') {
      setState(() {
        _controller.text = _names[index];
        _editingIndex = index;
      });
    }
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Item'),
        content: Text('Are you sure want to delete Item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _names.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addOrUpdateName,
              child: Text(_editingIndex == null ? 'Add' : 'Update'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _names.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showNameDialog(_names[index]),
                    onLongPress: () => _showContextMenu(index),
                    child: Card(
                      child: ListTile(
                        title: Text(_names[index]),
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
