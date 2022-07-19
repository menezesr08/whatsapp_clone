import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/info.dart';
import 'package:whatsapp_clone/widgets/chat_list.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(info[0]['name'].toString()),
        leading: CircleAvatar(
          radius: 2,
          backgroundColor: appBarColor,
          child: ClipOval(
            child: Image.network(
              'https://i.pinimg.com/236x/38/aa/95/38aa95f88d5f0fc3fc0f691abfaeaf0c.jpg',
              height: 40,
              width: 40,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ChatList(),
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: mobileChatBoxColor,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.emoji_emotions,
                color: Colors.grey,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.attach_file,
                    color: Colors.grey,
                  ),
                  Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            hintText: 'Type a message',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ]),
    );
  }
}
