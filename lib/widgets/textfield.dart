import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'custom_button.dart';

enum InputMode {
  text,
  voice,
}

class TextAndVoiceField extends ConsumerStatefulWidget {
  final String? message;

  const TextAndVoiceField({Key? key, this.message}) : super(key: key);

  @override
  ConsumerState<TextAndVoiceField> createState() => _TextAndVoiceFieldState();
}

class _TextAndVoiceFieldState extends ConsumerState<TextAndVoiceField> {
  late TextEditingController _messageController;

  bool _isReplying = false;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();

    _messageController = TextEditingController(text: widget.message);
  }

  @override
  void dispose() {
    _messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              onTap: () async {},
              showCursor: true,
              expands: true,
              maxLines: null,
              controller: _messageController,
              onChanged: (value) {},
              cursorColor: Theme.of(context).colorScheme.onPrimary,
              decoration: InputDecoration(
                labelText: "As me some thing",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          ToggleButton(
            isListening: _isListening,
            isReplying: _isReplying,
            inputMode: InputMode.text,
            sendTextMessage: () {
              final message = _messageController.text;
              _messageController.clear();
              sendTextMessage(message);
            },
          ),
        ],
      ),
    );
  }

  Future<void> sendTextMessage(String message) async {
    setReplyingState(true);

    setReplyingState(false);
    // ref.read(chatsProvider.notifier).clean();
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void setListeningState(bool isListening) {
    setState(() {
      _isListening = isListening;
    });
  }
}
