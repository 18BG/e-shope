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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white10,
        body: Center(child: Container(child: Text("Coming soon"))));
  }
}
