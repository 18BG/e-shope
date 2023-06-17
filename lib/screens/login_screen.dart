import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  signIn,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  hint: username,
                  hide: true,
                  suffix: false,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  hint: password,
                  hide: true,
                  suffix: true,
                  prefix: false,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(signIn))
            ],
          ),
        ),
      ),
    );
  }
}
