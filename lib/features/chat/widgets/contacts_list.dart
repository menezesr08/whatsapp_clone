import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/features/chat/controller/chat_controller.dart';

import '../../../info.dart';
import '../screens/mobile_chat_screen.dart';
import '../../../models/chat_contact.dart';

class ContactsList extends ConsumerWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: StreamBuilder<List<ChatContact>>(
          stream: ref.watch(chatControllerProvider).chatContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var chatContactData = snapshot.data![index];
            
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MobileChatScreen.routeName,
                              arguments: {
                                'name': chatContactData.name,
                                'uid': chatContactData.contactId,
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ListTile(
                            title: Text(chatContactData.name,
                                style: const TextStyle(fontSize: 18)),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                chatContactData.lastMessage,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                chatContactData.profilePic,
                              ),
                            ),
                            trailing: Text(
                              DateFormat.Hm().format(chatContactData.timeSent),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: dividerColor,
                        indent: 85,
                      ),
                    ],
                  );
                });
          }),
    );
  }
}
