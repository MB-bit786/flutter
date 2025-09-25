import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'messagescrren.dart';
import 'signin.dart';
import 'create_group.dart';
import 'group_chat_screen.dart';

class Dashboard extends StatefulWidget {
  final User user;
  Dashboard({super.key, required this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username;

  Future<void> getUserInfo() async {
    var doc = await FirebaseFirestore.instance.collection("users").doc(widget.user.uid).get();
    setState(() {
      username = doc.data()?['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Widget _sectionHeader(BuildContext context, String title, {Widget? action}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          if (action != null) action,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, ${username ?? 'User'}"),
        actions: [
          IconButton(
            tooltip: "Create group",
            icon: Icon(Icons.group_add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CreateGroup(userId: widget.user.uid)));
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _sectionHeader(context, "People")),
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (!snapshot.hasData) {
                  return SizedBox.shrink();
                }
                final users = snapshot.data!.docs.where((u) => u.id != widget.user.uid).toList();
                if (users.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: _EmptyState(icon: Icons.people_outline, title: "No other users yet"),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  separatorBuilder: (_, __) => SizedBox(height: 8),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final data = user.data();
                    final name = data["name"] ?? "User";
                    final email = data["email"] ?? "";
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        leading: CircleAvatar(child: Text(name.toString().isNotEmpty ? name.toString()[0] : '?')),
                        title: Text(name),
                        subtitle: Text(email),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Messagescrren(documentSnapshot: user)));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: _sectionHeader(context, "Your Groups")),
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("groups")
                  .where("members", arrayContains: widget.user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (!snapshot.hasData) {
                  return SizedBox.shrink();
                }
                final groups = snapshot.data!.docs;
                if (groups.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: _EmptyState(icon: Icons.group_outlined, title: "You are not in any groups yet"),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: groups.length,
                  separatorBuilder: (_, __) => SizedBox(height: 8),
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    final data = group.data();
                    final name = data["name"] ?? "Group";
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor: cs.primary.withOpacity(.15), child: Icon(Icons.group, color: cs.primary)),
                        title: Text(name),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => GroupChatScreen(groupId: group.id, groupName: name)),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Sign out",
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Signin()));
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  const _EmptyState({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: cs.primary.withOpacity(.15),
            child: Icon(icon, color: cs.primary),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}