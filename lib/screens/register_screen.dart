import 'package:e_shope/utilities/constants.dart';
import 'package:e_shope/widgets/input.dart';
import 'package:flutter/material.dart';

import '../widgets/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        //padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Form(
          key: key,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  signUp,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              NameTextField(),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  hint: "Password",
                  hide: true,
                  suffix: true,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  hint: "Password",
                  hide: true,
                  suffix: true,
                  prefix: false,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Créer un compte"))
            ],
          ),
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormFields(
              hint: "Password",
              hide: true,
              suffix: true,
              prefix: false,
            ),
          ),
          Expanded(
            child: TextFormFields(
              hint: "Password",
              hide: true,
              suffix: true,
              prefix: false,
            ),
          ),
        ],
      ),
    );
  }
}
