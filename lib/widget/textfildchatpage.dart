import 'package:chatapp/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TextFieldChatPage extends StatefulWidget {
  final ScrollController controllerScroll;
final String email;
  const TextFieldChatPage({
    super.key,
    required this.controllerScroll, required this.email,
  });

  @override
  State<TextFieldChatPage> createState() => _TextFieldChatPageState();
}

class _TextFieldChatPageState extends State<TextFieldChatPage> {
  final TextEditingController controller = TextEditingController();
  int maxId = 0; // We will store the maximum ID here

  Future<void> findMaxId() async {
    var collection = FirebaseFirestore.instance.collection(databasemeasges);
    QuerySnapshot querySnapshot = await collection.get();

    int currentMaxId = 0;
    for (var doc in querySnapshot.docs) {
      int docId = int.tryParse(doc['id'].toString()) ?? 0;
      if (docId > currentMaxId) {
        currentMaxId = docId;
      }
    }
    maxId = currentMaxId + 1; // Increment to ensure a unique ID
  }

  void sendMessage() async {
    await findMaxId(); // Ensure we have the latest max ID

    FirebaseFirestore.instance.collection(databasemeasges).add({
      'text': controller.text,
      'time': "${DateTime.now().hour}:${DateTime.now().minute}",
      'date': DateTime.now(),
      'id': maxId.toString(),
      'email': widget.email,
    });

    controller.clear();
    _scrollDown();
  }

  void _scrollDown() {
    widget.controllerScroll.animateTo(
      widget.controllerScroll.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter your message',
          suffixIcon: IconButton(
            icon: Icon(Icons.send, color: Color(colorback)),
            onPressed: sendMessage,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color(colorback)),
          ),
        ),
      ),
    );
  }
}
