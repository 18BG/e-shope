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
    return SingleChildScrollView(
      child: Form(
        key: key,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: const Text(
                "Créez un compte personnelle",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
    );
  }
}
