import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_shope/screens/login_screen.dart';
import 'package:e_shope/services/firebase_management.dart';
import 'package:e_shope/utilities/constants.dart';

import 'package:flutter/material.dart';

import '../widgets/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseManagement firebase = FirebaseManagement();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String? check(String? value) {
    if (value!.isEmpty) {
      return "Champ obligatoire";
    } else {
      return null;
    }
  }

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
              Container(
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
                        toChange: firstNameController,
                        hint: firstName,
                        f: check,
                        hide: false,
                        suffix: false,
                        prefix: false,
                      ),
                    ),
                    Expanded(
                      child: TextFormFields(
                        toChange: lastNameController,
                        hint: lastName,
                        f: check,
                        hide: false,
                        suffix: false,
                        prefix: false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  toChange: phoneNumberController,
                  hint: phone,
                  f: check,
                  hide: false,
                  suffix: false,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  toChange: addressController,
                  f: check,
                  hint: address,
                  hide: false,
                  suffix: false,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  hint: username,
                  toChange: usernameController,
                  f: check,
                  hide: false,
                  suffix: false,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  hint: mail,
                  f: check,
                  toChange: emailController,
                  hide: false,
                  suffix: false,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  toChange: passwordController,
                  f: check,
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
                    if (key.currentState!.validate()) {
                      String thisprenom,
                          thisnom,
                          thisphoneNumber,
                          thisaddress,
                          thisusername,
                          thisemail,
                          thispassword;
                      thisprenom = firstNameController.text;
                      thisnom = lastNameController.text;
                      thisphoneNumber = phoneNumberController.text;
                      thisaddress = addressController.text;
                      thisusername = usernameController.text;
                      thisemail = emailController.text;
                      thispassword = passwordController.text;
                      await firebase.createNewClient(
                          thisnom,
                          thisprenom,
                          thisusername,
                          thisemail,
                          thisaddress,
                          thisphoneNumber,
                          thispassword,
                          DateTime.now().toIso8601String(),
                          null);
                      // await createUser(thisprenom, thisnom, thisphoneNumber,
                      //     thisaddress, thisusername, thisemail, thispassword);
                      // ignore: use_build_context_synchronously
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const LoginScreen();
                      }));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Tous les champs sont obligatoire !")));
                    }
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

  Future<void> createUser(
      String thisprenom,
      String thisnom,
      String thisphoneNumber,
      String thisaddress,
      String thisusername,
      String thisemail,
      String thispassword) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('Client');
      await users.add({
        firstName: thisprenom,
        lastName: thisnom,
        phone: thisphoneNumber,
        address: thisaddress,
        username: thisusername,
        mail: thisemail,
        password: thispassword
      });
      print("User create");
    } catch (e) {
      print('Erreur lors de l\'enregistrement de l\'utilisateur : $e');
    }
  }
//   void createUser(String firstName, String lastName, String phoneNumber, String address, String username, String email, String password) async {
//   try {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//     await users.add({
//       'firstName': firstName,
//       'lastName': lastName,
//       'phoneNumber': phoneNumber,
//       'address': address,
//       'username': username,
//       'email': email,
//       'password': password,
//     });
//     print('Utilisateur enregistré avec succès.');
//   } catch (e) {
//     print('Erreur lors de l\'enregistrement de l\'utilisateur : $e');
//   }
// }
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
