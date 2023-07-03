import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/client_model.dart';
import '../services/firebase_management.dart';

class UserProvider with ChangeNotifier {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? username;
  String? email;

  String? image;
  String? password;
  String? creation;
  String? token;
  QuerySnapshot? resultat;

  bool get isLoggedIn => email != null;
  FirebaseManagement firebase = FirebaseManagement();
  Future<bool> updateProvider(ClientModel client) async {
    print("updateProvider");
    try {
      // bool isUpdated = await firebase.updateProfileImage(
      //     client.firebaseToken!, client.image!);
      await firebase.updateClientInformation(client);
      ClientModel re = await firebase.getClient(client.firebaseToken!);

      lastName = re.nom;
      firstName = re.prenom;
      phoneNumber = re.telephone;
      address = re.addresse;
      username = re.thisusername;
      email = re.thismail;
      password = re.thispassword;
      image = re.image;
      creation = re.thiscreationDate;
      token = re.firebaseToken;

      print(isLoggedIn);
    } catch (e) {
      print(e);
    }

    print("finish updateProvider");
    notifyListeners();
    return true;
  }

  Future<QuerySnapshot> login(String user, String passwor) async {
    // Effectuez vos opérations de connexion ici
    QuerySnapshot result = await firebase.login(user, passwor);
    if (result.docs.isNotEmpty) {
      List<ClientModel> re = await firebase.getClients();
      for (var element in re) {
        if (element.thisusername == user && element.thispassword == passwor) {
          lastName = element.nom;
          firstName = element.prenom;
          phoneNumber = element.telephone;
          address = element.addresse;
          username = element.thisusername;
          email = element.thismail;

          creation = element.thiscreationDate;
          image = element.image;
          password = element.thispassword;
          token = element.firebaseToken;
          print(token);

          print(isLoggedIn);
          notifyListeners();
        }
      }
    }
    resultat = result;
    return resultat!;
    // Une fois la connexion réussie, mettez à jour les informations de l'utilisateur
  }

  void logout() {
    // Effectuez vos opérations de déconnexion ici

    // Réinitialisez les informations de l'utilisateur
    firstName = null;
    lastName = null;
    phoneNumber = null;
    address = null;
    username = null;
    email = null;

    notifyListeners();
  }

  // Ajoutez d'autres méthodes pour mettre à jour les informations de l'utilisateur, etc.
}
