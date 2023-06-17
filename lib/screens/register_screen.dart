import 'package:e_shope/models/phone_number.dart';
import 'package:e_shope/screens/login_screen.dart';
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
                  hint: phone,
                  hide: true,
                  suffix: false,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  hint: address,
                  hide: true,
                  suffix: false,
                  prefix: false,
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
                  hint: mail,
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
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return LoginScreen();
                    }));
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.black,
                        )
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
              hint: firstName,
              hide: true,
              suffix: false,
              prefix: false,
            ),
          ),
          Expanded(
            child: TextFormFields(
              hint: lastName,
              hide: true,
              suffix: false,
              prefix: false,
            ),
          ),
        ],
      ),
    );
  }
}
