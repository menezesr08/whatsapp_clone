import 'package:flutter/material.dart';
import 'package:whatsapp_clone/info.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if(messages[index]['isMe'] == true) {
          // Return my message -> Card
        } else {
          // Return sender message -> Card
        }
      },
    );
  }
}