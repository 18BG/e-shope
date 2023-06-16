import 'package:flutter/material.dart';

@immutable
class ChatModele {
  final String message;
  final bool isMe;

  const ChatModele({
    required this.message,
    required this.isMe,
  });
}
