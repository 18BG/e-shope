import 'package:e_shope/widgets/best.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class Input extends StatefulWidget {
  Input(
      {this.labelText,
      this.hintText,
      this.iconType,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      this.validator,
      this.onSaved,
      this.targetText,
      this.defaultText,
      this.prefixIcon,
      this.controller,
      this.rayon = 50.0,
      this.validationType});

  final IconData? iconType;
  final double rayon;
  final String? labelText;
  final String? hintText;
  final String? targetText;
  final String? validationType;
  final String? defaultText;
  final TextEditingController? controller;
  final bool? prefixIcon;
  final TextInputType? inputType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  final _textController = TextEditingController();
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_checkValid);
    if (widget.defaultText?.isEmpty == false) {
      widget.controller!.text = widget.defaultText!;
      _textController.text = widget.defaultText!;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  _checkValid() {
    setState(() {
      switch (widget.validationType!.toLowerCase()) {
        case 'email':
          _validate = Bg.isValidEmail(_textController.text);
          break;
        case 'password':
          _validate = Bg.isValidPassword(_textController.text);
          break;
        case 'name':
          _validate = Bg.isValidName(_textController.text);
          break;
        case 'equalfield':
          _validate = _textController.text == widget.targetText;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText!,
      keyboardType: widget.inputType!,
      validator: widget.validator,
      onSaved: widget.onSaved,
      cursorColor: Color(0xFF634075),
      style: kControl,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon == true
            ? Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF634075),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5],
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Icon(
                  widget.iconType,
                  size: 16.0,
                  color: Colors.white,
                ),
              )
            : null,
        suffixIcon: _validate
            ? Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                      width: .0,
                      color: const Color(0xFFad5389),
                    )),
                child: const Icon(
                  Icons.check,
                  size: 16.0,
                  color: Color(0xFFad5389),
                ),
              )
            : null,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: widget.hintText,
        labelText: widget.labelText,
        fillColor: Colors.grey,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(widget.rayon),
        ),
      ),
    );
  }
}
