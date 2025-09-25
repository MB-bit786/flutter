import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Messagescrren extends StatefulWidget {
  final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;

  Messagescrren({super.key, required this.documentSnapshot});

  @override
  State<Messagescrren> createState() => _MessagescrrenState();
}

class _MessagescrrenState extends State<Messagescrren> {
  final TextEditingController _messageController = TextEditingController();

  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return DateFormat.jm().format(dateTime);
  }

  Future<void> sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;
    await FirebaseFirestore.instance.collection("chats").add({
      "senderId": FirebaseAuth.instance.currentUser!.uid,
      "receiverId": widget.documentSnapshot.id,
      "message": _messageController.text,
      "timestamp": DateTime.now(),
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final receiverName = widget.documentSnapshot.data()?['name'] ?? 'User';
    return Scaffold(
      appBar: AppBar(title: Text(receiverName)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance.collection("chats").orderBy("timestamp").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final all = snapshot.data!.docs;
                  final messages = all.where((doc) {
                    final data = doc.data();
                    return (data["senderId"] == currentUserId && data["receiverId"] == widget.documentSnapshot.id) ||
                        (data["receiverId"] == currentUserId && data["senderId"] == widget.documentSnapshot.id);
                  }).toList();

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      final data = msg.data();
                      final bool isCurrentUser = data["senderId"] == currentUserId;

                      final bubbleColor = isCurrentUser ? cs.primary : cs.surfaceContainerHigh;
                      final textColor = isCurrentUser ? cs.onPrimary : cs.onSurface;

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
                                data["message"],
                                style: TextStyle(color: textColor, fontSize: 15),
                              ),
                              SizedBox(height: 4),
                              Text(
                                formatTimestamp(data["timestamp"]),
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
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message",
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