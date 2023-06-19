import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/client_model.dart';
import 'package:e_shope/models/commande_model.dart';
import 'package:e_shope/models/like_model.dart';
import 'package:e_shope/models/panier_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/utilities/constants.dart';
//import 'package:firebase_storage/firebase_storage.dart';

import '../models/categorie_model.dart';

class FirebaseManagement {
  //create firebase Firestore database instance
  final _db = FirebaseFirestore.instance;

  //create firebase Storage database instance
  //final _refs = FirebaseStorage.instance;
//function to login a user
  Future<QuerySnapshot<Object?>> login(
    String thusername,
    String thpassword,
  ) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Client')
        .where(username, isEqualTo: thusername)
        .where(password, isEqualTo: thpassword)
        .get();
    return querySnapshot;
  }

  //Cette fonction permet de creer un nouveau utilisatuer dont les information seront passer en argument
  //de la fonction
  createNewClient(
    String nom,
    String prenom,
    String thusername,
    String thmail,
    String thaddress,
    String telephone,
    String thpassword,
    String creationDate,
    String? images,
  ) async {

    try {
        //ici nous faisons appel a l'instance firestore que nous avons creer ci-dessus pour ajouter le client dans la collection
    //client sinon de creer la collection si elle ne l'ai pas
    //C'est la fonction add qui permet d'ajouter un client tout en creant une reference automatiquement
      await _db.collection("Client").add({
        lastName: nom,
        firstName: prenom,
        username: thusername,
        "Image": (images == null) ? "" : images,
        mail: thmail,
        address: thaddress,
        phone: telephone,
        password: thpassword,
        "Date": creationDate
      });
    } catch (e) {
      print('Erreur lors de l\'enregistrement de l\'utilisateur : $e');
    }

  
   
  }


  //Cette fonction permet de mettre a jour l'utilisatuer dont les information seront passer en argument

  //de la fonction
  updateClientInformation(ClientModel client) async {
    print("updateClientInformation");
    print(client.firebaseToken);
    print("D2RGnRKFu4zgPemFWgiL");
    try {
      await _db.collection("Client").doc(client.firebaseToken).update({
        "Nom": client.nom,
        "Prenom": client.prenom,
        "Username": client.thisusername,
        "Image": client.image,
        "Mail": client.thismail,
        "Addresse": client.addresse,
        "Telephone": client.telephone,
        "Password": client.thispassword,
      });
    } catch (e) {
      print(e);
    }
    print("updateClientInformation finish");
  }

  //function to delete client instance
  deleteClient(ClientModel client) async {
    await _db.collection("Client").doc(client.firebaseToken).delete();
  }

  //function to get All client
  Future<List<ClientModel>> getClients() async {
    final data = await _db.collection("Client").get();
    final clients = data.docs.map((e) => ClientModel.fromSnapshot(e)).toList();
    for (final i in clients) {
      //get specifics client likes list from firebase
      final likes = await _db
          .collection("Client")
          .doc(i.firebaseToken)
          .collection("Like")
          .get();
      //get specifics client Commandes list from firebase
      final commandes = await _db
          .collection("Client")
          .doc(i.firebaseToken)
          .collection("Commande")
          .get();
      //get specifics client Panniers list from firebase
      final panniers = await _db
          .collection("Client")
          .doc(i.firebaseToken)
          .collection("Pannier")
          .get();
      //add likes list to client likes list
      final likesListe =
          likes.docs.map((e) => LikeModel.fromSnapshot(e)).toList();
      i.likes = likesListe;
      //add Commande list to client Commande list
      final commandeListe =
          commandes.docs.map((e) => CommandeModel.fromSnapshot(e)).toList();
      i.commandes = commandeListe;
      //add Pannier list to client pannier list
      final pannierListe =
          panniers.docs.map((e) => PanierModel.fromSnapshot(e)).toList();
      i.panniers = pannierListe;
    }
    return clients;
  }

  //function to get All client

  Future<ClientModel> getClient(String firebaseToken) async {
    final data = await _db.collection("Client").doc(firebaseToken).get();

    final Lclient = ClientModel.fromSnapshot(data);
    return Lclient;
  }

  //function get All Categories
  Future<List<CategorieModel>> getCategorie() async {
    final data = await _db.collection("Categorie").get();
    final categories =
        data.docs.map((e) => CategorieModel.fromSnapshot(e)).toList();
    for (final i in categories) {
      //get specifics categorie products list from firebase
      final products = await _db
          .collection("Categorie")
          .doc(i.firebaseToken)
          .collection("Produit")
          .get();
      //add products list to client product list
      final productListe =
          products.docs.map((e) => ProduitModel.fromSnapshot(e)).toList();
      i.listProduit = productListe;
    }
    return categories;
  }

  //function to create commande
  createCommande(ClientModel client, CommandeModel commande) async {
    final commandeRef = await _db
        .collection("Client")
        .doc(client.firebaseToken)
        .collection("Commande")
        .add({
      "Date": commande.dateCommande,
      "Etat": commande.etatCommande,
      "qteStock": commande.qteCommande,
    });
    final newRef = commandeRef.id;
    await _db
        .collection("Client")
        .doc(client.firebaseToken)
        .collection("Commande")
        .doc(newRef)
        .collection("Produit")
        .add({
      "Nom": commande.produit.nom,
      "Description": commande.produit.description,
      "Prix": commande.produit.prix,
      "Image": commande.produit.image,
      "qteStock": commande.produit.qteStock,
    });
  }

  //function to delete Commande
  deleteCommande(ClientModel client, CommandeModel commande) async {
    await _db
        .collection("Client")
        .doc(client.firebaseToken)
        .collection("Commande")
        .doc(commande.firebaseToken)
        .delete();
  }

  //function to create pannier
  createPannier(ClientModel client, PanierModel pannier) async {
    final pannierRef = await _db
        .collection("Client")
        .doc(client.firebaseToken)
        .collection("Pannier")
        .add({});
    final newRef = pannierRef.id;
    {
      await _db
          .collection("Client")
          .doc(client.firebaseToken)
          .collection("Pannier")
          .doc(newRef)
          .collection("Produit")
          .add({
        "Nom": pannier.produit.nom,
        "Description": pannier.produit.description,
        "Prix": pannier.produit.prix,
        "Image": pannier.produit.image,
        "qteStock": pannier.produit.qteStock,
      });
    }

    //function to update pannier
    updatePannier(ClientModel client, PanierModel pannier) async {
      await _db
          .collection("Client")
          .doc(client.firebaseToken)
          .collection("Pannier")
          .doc(pannier.firebaseToken)
          .collection("Produit")
          .add({
        "Nom": pannier.produit.nom,
        "Description": pannier.produit.description,
        "Prix": pannier.produit.prix,
        "Image": pannier.produit.image,
        "qteStock": pannier.produit.qteStock,
      });
    }
  }

  deletePannier(ClientModel client, PanierModel panier) async {
    await _db
        .collection("Client")
        .doc(client.firebaseToken)
        .collection("Pannier")
        .doc(panier.firebaseToken)
        .delete();
  }

  //function to like product
  addToLike(ClientModel client, ProduitModel like) async {
    await _db
        .collection("Client")
        .doc(client.firebaseToken)
        .collection("Like")
        .add({
      "Nom": like.nom,
      "Description": like.description,
      "Prix": like.prix,
      "Image": like.image,
      "qteStock": like.qteStock,
      "Like": like.like,
      "FirebaseToken": like.firebaseToken
    });
  }

  //function to diselike product
  deleteLike(ClientModel client, LikeModel like) async {
    await _db
        .collection("Client")
        .doc(client.firebaseToken)
        .collection("Like")
        .doc(like.firebaseToken)
        .delete();
  }
}
