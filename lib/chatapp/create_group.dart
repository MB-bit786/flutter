import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  final String userId;
  const CreateGroup({super.key, required this.userId});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  List<QueryDocumentSnapshot<Map<String, dynamic>>> _allUsers = [];
  final Set<String> _selectedUserIds = {};
  bool _isLoading = false;

  Future<void> _loadUsers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final query = await FirebaseFirestore.instance.collection("users").get();
      final docs = query.docs.where((d) => d.id != widget.userId).toList();
      setState(() {
        _allUsers = docs.cast<QueryDocumentSnapshot<Map<String, dynamic>>>();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> createGroup() async {
    final name = _groupNameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a group name")),
      );
      return;
    }

    final members = <String>{widget.userId, ..._selectedUserIds}.toList();

    if (members.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Select at least 1 other member")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseFirestore.instance.collection("groups").add({
        "name": name,
        "members": members,
        "createdAt": DateTime.now(),
        "createdBy": widget.userId,
      });
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to create group: $e")),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final filteredUsers = _allUsers.where((u) {
      final data = u.data();
      final name = (data["name"] ?? "").toString().toLowerCase();
      final email = (data["email"] ?? "").toString().toLowerCase();
      return name.contains(query) || email.contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Create Group")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _groupNameController,
                  decoration: InputDecoration(
                    labelText: "Group Name",
                    prefixIcon: Icon(Icons.group),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: "Search people by name or email",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: -8,
                  children: [
                    InputChip(
                      label: Text("You"),
                      avatar: CircleAvatar(child: Icon(Icons.person, size: 16)),
                      onDeleted: null,
                    ),
                    ..._selectedUserIds.where((id) => _allUsers.any((u) => u.id == id)).map((id) {
                      final user = _allUsers.firstWhere((u) => u.id == id);
                      final name = user.data()["name"] ?? "User";
                      return InputChip(
                        label: Text(name),
                        avatar: CircleAvatar(child: Text(name.toString().isNotEmpty ? name.toString()[0] : '?')),
                        onDeleted: () {
                          setState(() {
                            _selectedUserIds.remove(id);
                          });
                        },
                      );
                    }).toList(),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : filteredUsers.isEmpty
                    ? Center(child: Text(query.isEmpty ? "No users found" : "No match for '$query'"))
                    : ListView.separated(
                        itemCount: filteredUsers.length,
                        separatorBuilder: (_, __) => Divider(height: 1),
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          final data = user.data();
                          final name = data["name"] ?? "User";
                          final email = data["email"] ?? "";
                          final isSelected = _selectedUserIds.contains(user.id);
                          return CheckboxListTile(
                            value: isSelected,
                            onChanged: (checked) {
                              setState(() {
                                if (checked == true) {
                                  _selectedUserIds.add(user.id);
                                } else {
                                  _selectedUserIds.remove(user.id);
                                }
                              });
                            },
                            title: Text(name),
                            subtitle: Text(email),
                            secondary: CircleAvatar(child: Text(name.toString().isNotEmpty ? name.toString()[0] : '?')),
                          );
                        },
                      ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _isLoading ? null : createGroup,
              icon: Icon(Icons.check),
              label: Text("Create Group"),
            ),
          ),
        ),
      ),
    );
  }
}