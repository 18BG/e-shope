import 'package:e_shope/screens/login_screen.dart';

import 'package:e_shope/screens/provider.dart';
import 'package:e_shope/utilities/constants.dart';
import 'package:e_shope/widgets/change_profil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  List<Map<String, String>> user = [
    // {lastName: "Dembele"},
    // {username: "Entrepreneur"},
    // {phone: "99529985"},
    // {mail: "Aymane@70dembele"},
    // {address: "Kalaban"},
    // {"Total order": "25"}
  ];

  //List<ClientModel> client = [];
  late UserProvider userProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Vérifiez si l'utilisateur est connecté

    userProvider = Provider.of<UserProvider>(context, listen: false);
    if (userProvider.isLoggedIn) {
      user.add({lastName: userProvider.lastName!});
      user.add({firstName: userProvider.firstName!});
      user.add({username: userProvider.username!});
      user.add({phone: userProvider.lastName!});
      user.add({mail: userProvider.email!});
      user.add({address: userProvider.address!});
    }

    return Scaffold(
        body: (userProvider.isLoggedIn)
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 30),
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
                                child: (userProvider.isLoggedIn &&
                                        userProvider.image != "")
                                    ? Image.network(
                                        userProvider.image!,
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
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Aymane Dembele",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Entrepreneur"),
                                  Text("Aymane@70dembele")
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
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                    trailing: Text(value),
                                  ),
                                );
                              }),
                          ListTile(
                            title: Text("Changer le profil"),
                            trailing: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (_) => Profil());
                                },
                                icon: Icon(Icons.edit_square)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Connectez-vous pour voir vos informations et ou pour les modifier",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return LoginScreen();
                            }));
                          },
                          child: const Text("Se connecter"))
                    ],
                  ),
                ),
              ));
  }
}
