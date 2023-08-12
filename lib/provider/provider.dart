import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/commande_model.dart';
import 'package:e_shope/models/like_model.dart';
import 'package:e_shope/models/panier_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:flutter/material.dart';

import '../models/achat_produit.dart';
import '../models/categorie_model.dart';
import '../models/client_model.dart';
import '../services/firebase_management.dart';

class UserProvider with ChangeNotifier {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? username;
  String? email;
  bool isLoading = false;
  List<CategorieModel> categoryList = [];
  List<LikeModel> likeList = [];
  List<PanierModel> panierList = [];
  List<ProduitModel> listProduit = [];
  List<CommandeModel> commandeList = [];
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
      username = re.username;
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

  Future<bool> getCategoryProvider() async {
    try {
      var result = await firebase.getCategorieAndProduc();
      result.forEach((element) {
        element.listProduit!.forEach((element) {
          listProduit.add(element);
        });
      });
      categoryList = result;
      print(result.length);
    } catch (e) {
      print("ereror $e");
    }

    notifyListeners();
    return true;
  }

  void isProcessing() {
    isLoading = !isLoading;
    notifyListeners();
  }

//provider for the connexion
  Future<ClientModel> login(String user, String passwor) async {
    // Effectuez vos opérations de connexion ici
    ClientModel element = await firebase.login(user, passwor);

    if (element.username == user && element.thispassword == passwor) {
      lastName = element.nom;
      firstName = element.prenom;
      phoneNumber = element.telephone;
      address = element.addresse;
      username = element.username;
      email = element.thismail;

      creation = element.thiscreationDate;
      image = element.image;
      password = element.thispassword;
      token = element.firebaseToken;
      print(token);

      print(isLoggedIn);
      notifyListeners();
    }
    likeList = await firebase.getLikedList(token!);
    panierList = await firebase.getAllPannier(token!);
    commandeList = await firebase.getAllCommande(token!);
    return element;
    // Une fois la connexion réussie, mettez à jour les informations de l'utilisateur
  }

  Future<void> getLikeList() async {
    token != null ? likeList = await firebase.getLikedList(token!) : [];
    notifyListeners();
  }

  Future<void> getPannierList() async {
    token != null ? panierList = await firebase.getAllPannier(token!) : [];
    notifyListeners();
  }

  Future<bool> addCommande(CommandeModel commande) async {
    if (token != null) {
      firebase.createCommande(token!, commande);
      deletePannier(commande.produit.first);
      commandeList = await firebase.getAllCommande(token!);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addToPaannier(AchatProduitModel produit) async {
    if (token != null) {
      if (panierList.isEmpty) {
        PanierModel pannier = PanierModel(
            produit: [produit], prixTotal: produit.prix, qteProduit: 1);
        firebase.createPannier(token!, pannier);
        panierList = await firebase.getAllPannier(token!);
        notifyListeners();
      } else {
        firebase.updatePannier(token, produit, panierList.first.firebaseToken);
        panierList = await firebase.getAllPannier(token!);
        notifyListeners();
      }

      notifyListeners();
      print(token);
      return true;
    } else {
      print(false);
      return false;
    }
  }

  Future<bool> diseToPannierProduct(PanierModel pannier, produit) async {
    if (token != null) {
      firebase.deleteProductPannier(token!, pannier, produit);
      panierList = await firebase.getAllPannier(token!);
      notifyListeners();
      print(token);
      return true;
    } else {
      print(false);
      return false;
    }
  }

  Future<bool> deletePannier(pannier) async {
    if (token != null) {
      firebase.deletePannier(token!, pannier);
      panierList = await firebase.getAllPannier(token!);
      panierList.clear();
      notifyListeners();
      print(token);
      return true;
    } else {
      print(false);
      return false;
    }
  }

  Future<bool> likeProduct(ProduitModel produit) async {
    if (token != null) {
      firebase.addToLike(token!, produit);
      likeList = await firebase.getLikedList(token!);
      notifyListeners();
      print(token);
      return true;
    } else {
      print(false);
      return false;
    }
  }

  Future<bool> diseLikeProduct(LikeModel produit) async {
    if (token != null) {
      firebase.deleteLike(token!, produit);
      likeList = await firebase.getLikedList(token!);
      notifyListeners();
      print(token);
      return true;
    } else {
      print(false);
      return false;
    }
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
    panierList = [];
    likeList = [];
    commandeList = [];
    notifyListeners();
  }

  // Ajoutez d'autres méthodes pour mettre à jour les informations de l'utilisateur, etc.
}
