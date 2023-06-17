import 'package:flutter/material.dart';

class ChatModel extends StatefulWidget {
  final String text;
  final bool isMe;
  const ChatModel({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  State<ChatModel> createState() => _ChatModelState();
}

class _ChatModelState extends State<ChatModel> {
  bool isSpeacking = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!widget.isMe) ProfileContainer(isMe: widget.isMe),
          if (!widget.isMe) const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.60,
            ),
            decoration: BoxDecoration(
              color: widget.isMe
                  ? Theme.of(context).colorScheme.secondary
                  : Colors.grey.shade800,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
                bottomLeft: Radius.circular(widget.isMe ? 15 : 0),
                bottomRight: Radius.circular(widget.isMe ? 0 : 15),
              ),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          if (widget.isMe) const SizedBox(width: 15),
          if (widget.isMe) ProfileContainer(isMe: widget.isMe),
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.secondary
              : Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Icon(
          isMe ? Icons.person : Icons.flag,
          color: Theme.of(context).colorScheme.onSecondary,
          size: 25,
        ),
      ),
    );
  }
}
