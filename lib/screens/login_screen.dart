import 'package:e_shope/provider/provider.dart';
import 'package:e_shope/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/firebase_management.dart';
import '../utilities/constants.dart';
import '../widgets/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseManagement firebase = FirebaseManagement();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final key = GlobalKey<FormState>();
  late UserProvider userProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

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
                  hint: usersname,
                  toChange: usernameController,
                  hide: false,
                  suffix: false,
                  prefix: false,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormFields(
                  toChange: passwordController,
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
                      String thisusername = usernameController.text;
                      String thispassword = passwordController.text;

                      try {
                        // Vérifiez si l'utilisateur existe dans votre collection 'Client' avec les informations fournies

                        // QuerySnapshot result =
                        //     await firebase.login(thisusername, thispassword);
                        var result = await userProvider.login(
                            thisusername, thispassword);
                        // ignore: invalid_use_of_protected_member

                        if (result != null) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(seconds: 3),
                                content: Text("Connexion reussie !")),
                          );
                        } else {
                          // Les informations d'identification fournies sont incorrectes
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Identifiants invalides. Veuillez réessayer.")),
                          );
                        }
                      } catch (e) {
                        print('Erreur lors de la connexion : $e');
                        // Affichez un message d'erreur ou effectuez des opérations en cas d'erreur de connexion.
                      }
                    }

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text(signIn)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous n'avez pas de compte ?",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const RegisterScreen();
                          }));
                        },
                        child: const Text("Créer un compte ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
