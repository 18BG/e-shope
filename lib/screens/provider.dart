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

  bool get isLoggedIn => email != null;
  FirebaseManagement firebase = FirebaseManagement();

  void login(String user, String passwor) async {
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

          print(isLoggedIn);
          notifyListeners();
        }
      }
    }
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
