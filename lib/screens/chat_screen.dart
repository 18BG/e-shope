import 'package:flutter/material.dart';

import '../models/chat_model.dart';
import '../widgets/chat_modele.dart';
import '../widgets/textfield.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatModele> chats = [
    const ChatModele(
      message: "Hello, comment ça va ?",
      isMe: true,
    )
  ];

  @override
  Widget build(BuildContext context) {
    const double bottomNavBarHeight = kBottomNavigationBarHeight;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: Container(
        height: MediaQuery.of(context).size.height - bottomNavBarHeight,
        child: Column(
          children: [
            Expanded(
              child: chats.isEmpty
                  ? const Center(
                      child: Text("Aucune Conversation"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: NeverScrollableScrollPhysics()),
                            //reverse: true,
                            shrinkWrap: true,
                            itemCount: chats.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                print(chats.length);
                              },
                              child: ChatModel(
                                text: chats[index].message,
                                isMe: chats[index].isMe,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: TextAndVoiceField(
                message: "jjj",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
