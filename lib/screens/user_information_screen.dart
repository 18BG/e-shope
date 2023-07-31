import 'package:e_shope/screens/login_screen.dart';

import 'package:e_shope/provider/provider.dart';
import 'package:e_shope/utilities/constants.dart';
import 'package:e_shope/widgets/change_profil.dart';
import 'package:e_shope/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/client_model.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  List<Map<String, String>> user = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<UserProvider>(
      builder: (conetext, userProvide, _) {
        Widget? toDisplay;
        if (userProvide.isLoggedIn) {
          user.clear();
          user.add({lastName: userProvide.lastName!});
          user.add({firstName: userProvide.firstName!});
          user.add({usersname: userProvide.username!});
          user.add({phone: userProvide.phoneNumber!});
          user.add({mail: userProvide.email!});
          user.add({address: userProvide.address!});
          toDisplay = SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 30),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                            // color: Colors.amber,
                            ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: (userProvide.isLoggedIn &&
                                    userProvide.image != "")
                                ? Image.network(
                                    userProvide.image!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/b1.png",
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 150,
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${user[1].values.first} ${user[0].values.first}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(user[2].values.first),
                              Text(user[4].values.first)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          shrinkWrap: true,
                          itemCount: user.length,
                          itemBuilder: (BuildContext context, index) {
                            final entry = user[index];
                            final key = entry.keys.first;
                            final value = entry.values.first;
                            return Card(
                              child: ListTile(
                                title: Text(key),
                                subtitle: Text(value),
                                trailing: IconButton(
                                    onPressed: () async {
                                      String titre = "";
                                      if (index == 0 ||
                                          index == 1 ||
                                          index == 2 ||
                                          index == 3) {
                                        titre = "Modification du $key";
                                      } else if (index == 4 || index == 5) {
                                        titre = "Modification de l'$key";
                                      }

                                      await updateInfo(titre, value, index);
                                    },
                                    icon: const Icon(Icons.edit)),
                              ),
                            );
                          }),
                      ListTile(
                        title: const Text("Changer le profil"),
                        trailing: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (_) => const Profil());
                            },
                            icon: const Icon(Icons.edit_square)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          user.clear();
          toDisplay = Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Connectez-vous pour voir vos informations et ou pour les modifier",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const LoginScreen();
                        }));
                      },
                      child: const Text("Se connecter"))
                ],
              ),
            ),
          );
        }
        return toDisplay;
      },
    ));
  }

  updateInfo(String toUpdate, String lastValue, int i) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    TextEditingController control = TextEditingController();
    bool isButtonDisabled = true;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          void validateInfo() async {
            String newValue = control.text;
            ClientModel? thisClient;
            if (i == 0) {
              userProvider.lastName = newValue;
            } else if (i == 1) {
              userProvider.firstName = newValue;
            } else if (i == 2) {
              userProvider.username = newValue;
            } else if (i == 3) {
              userProvider.phoneNumber = newValue;
            } else if (i == 4) {
              userProvider.email = newValue;
            } else if (i == 5) {
              print(i);
              userProvider.address = newValue;
            } else {
              print("object");
            }
            thisClient = ClientModel(
              image: userProvider.image,
              nom: userProvider.lastName!,
              prenom: userProvider.firstName!,
              username: userProvider.username!,
              addresse: userProvider.address!,
              thismail: userProvider.email!,
              telephone: userProvider.phoneNumber!,
              thispassword: userProvider.password!,
              thiscreationDate: userProvider.creation!,
              firebaseToken: userProvider.token,
            );

            await userProvider.updateProvider(thisClient!);
            print('Nouvelle valeur de $toUpdate : $newValue');
            Navigator.pop(context);
          }

          void cancelUpdate() {
            Navigator.pop(context);
          }

          void onTextChanged(String value) {
            setState(() {
              isButtonDisabled = value.isEmpty;
            });
          }

          return AlertDialog(
            title: Text(toUpdate),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Entrez la nouvelle information"),
                const SizedBox(height: 10),
                TextFormFields(
                  hide: false,
                  prefix: false,
                  suffix: false,
                  hint: lastValue,
                  toChange: control,
                  onChange: onTextChanged,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: cancelUpdate,
                      child: const Text(
                        "Annuler",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: isButtonDisabled ? null : validateInfo,
                      child: const Text("Valider"),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
