import 'package:chatapp/widget/chatmodelseet.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/models/measgemodel.dart'; // Assuming this is correct and the model exists

class ChatBubbleFriend extends StatefulWidget {
  final measgemodel messageList;

  const ChatBubbleFriend({
    Key? key,
    required this.messageList,
  }) : super(key: key);

  @override
  _ChatBubbleFriendState createState() => _ChatBubbleFriendState();
}

class _ChatBubbleFriendState extends State<ChatBubbleFriend> {
  bool _isColored = false; // State variable to track color changes

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isColored = !_isColored; // Toggle color on long press
        });
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheetWidget(measge: widget.messageList,);
              
            });
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 24),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: _isColored
                ? Colors.orange
                : Colors.blueAccent, // Use the state variable here
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Text(
            widget.messageList.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatefulWidget {
  final measgemodel messageList;

  const ChatBubble({
    Key? key,
    required this.messageList,
  }) : super(key: key);

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  bool _isColored = false; // State variable to track color changes

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isColored = !_isColored; // Toggle color on long press
        });
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheetWidget(measge: widget.messageList,);
              
            });
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 24),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: _isColored
                ? Colors.orange
                : Colors.green, // Use the state variable here
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Text(
            widget.messageList.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

