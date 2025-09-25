import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroupChatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  const GroupChatScreen({super.key, required this.groupId, required this.groupName});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _msgController = TextEditingController();

  String formatTimestamp(Timestamp timestamp) {
    return DateFormat.jm().format(timestamp.toDate());
  }

  Future<void> sendMessage() async {
    if (_msgController.text.trim().isEmpty) return;
    await FirebaseFirestore.instance.collection("groups").doc(widget.groupId).collection("messages").add({
      "senderId": FirebaseAuth.instance.currentUser!.uid,
      "message": _msgController.text,
      "timestamp": DateTime.now(),
    });
    _msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(title: Text(widget.groupName)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("groups").doc(widget.groupId).collection("messages").orderBy("timestamp").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var messages = snapshot.data!.docs;
                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      var msg = messages[index];
                      bool isCurrentUser = msg["senderId"] == currentUserId;

                      final bubbleColor = isCurrentUser ? cs.tertiary : cs.surfaceContainerHigh;
                      final textColor = isCurrentUser ? cs.onTertiary : cs.onSurface;

                      return Align(
                        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: bubbleColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(isCurrentUser ? 16 : 4),
                              bottomRight: Radius.circular(isCurrentUser ? 4 : 16),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                msg["message"],
                                style: TextStyle(color: textColor, fontSize: 15),
                              ),
                              SizedBox(height: 4),
                              Text(
                                formatTimestamp(msg["timestamp"]),
                                style: TextStyle(fontSize: 11, color: textColor.withOpacity(.7)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    decoration: InputDecoration(
                      hintText: "Message",
                      prefixIcon: Icon(Icons.message_outlined),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: sendMessage,
                  icon: Icon(Icons.send_outlined, size: 18),
                  label: Text("Send"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}