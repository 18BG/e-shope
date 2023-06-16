import 'package:e_shope/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final VoidCallback _sendTextMessage;

  final InputMode _inputMode;

  final bool _isListening;
  const ToggleButton({
    super.key,
    required InputMode inputMode,
    required VoidCallback sendTextMessage,
    required bool isReplying,
    required bool isListening,
  })  : _inputMode = inputMode,
        _sendTextMessage = sendTextMessage,
        _isListening = isListening;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: () {
        widget._sendTextMessage;
      },
      child: Icon(
        widget._inputMode == InputMode.text
            ? Icons.send
            : widget._isListening
                ? Icons.mic_off
                : Icons.mic,
      ),
    );
  }
}
