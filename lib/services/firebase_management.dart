import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/Image_model.dart';
import 'package:e_shope/models/client_model.dart';
import 'package:e_shope/models/commande_model.dart';
import 'package:e_shope/models/like_model.dart';
import 'package:e_shope/models/new_produit.dart';
import 'package:e_shope/models/panier_model.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/utilities/constants.dart';

import '../models/achat_produit.dart';
import '../models/categorie_model.dart';

class FirebaseManagement {
  //create firebase Firestore database instance
  final _db = FirebaseFirestore.instance;

  //create firebase Storage database instance
  //final _refs = FirebaseStorage.instance;
//function to login a user
  Future<ClientModel> login(
    String thusername,
    String thpassword,
  ) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Client')
        .where(usersname, isEqualTo: thusername)
        .where(password, isEqualTo: thpassword)
        .get();
    final user =
        querySnapshot.docs.map((e) => ClientModel.fromSnapshot(e)).first;
    return user;
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
      await _db.collection(customer).add({
        lastName: nom,
        firstName: prenom,
        usersname: thusername,
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
    try {
      await _db.collection("Client").doc(client.firebaseToken).update({
        lastName: client.nom,
        firstName: client.prenom,
        usersname: client.username,
        "Image": client.image,
        mail: client.thismail,
        address: client.addresse,
        phone: client.telephone,
        password: client.thispassword,
      });
      print("updateClientInformation finish");
    } catch (e) {
      print(e);
    }
  }

  // Méthode de mise à jour de l'image de profil
  Future<bool> updateProfileImage(String token, String imageUrl) async {
    try {
      await _db.collection("Client").doc(token).update({
        "Image": imageUrl,
      });
      return true;
    } catch (e) {
      return false;
    }
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
  Future<List<CategorieModel>> getCategorieAndProduc() async {
    final data = await _db.collection(categoriCollection).get();
    final categories =
        data.docs.map((e) => CategorieModel.fromSnapshot(e)).toList();
    try {
      for (CategorieModel i in categories) {
        //get specifics categorie products list from firebase
        final products = await _db
            .collection(categoriCollection)
            .doc(i.firebaseToken)
            .collection(productCollection)
            .get();
        print(i.nom);
        final newproducts = await _db
            .collection(categoriCollection)
            .doc(i.firebaseToken)
            .collection(newProductCollection)
            .get();
        //add products list to client product list
        final newList = newproducts.docs
            .map((e) => NewProductModel.fromSnapshot(e))
            .toList();
        final productListe =
            products.docs.map((e) => ProduitModel.fromSnapshot(e)).toList();
        for (ProduitModel prod in productListe) {
          final img = await _db
              .collection(categoriCollection)
              .doc(i.firebaseToken)
              .collection(productCollection)
              .doc(prod.firebaseToken)
              .collection("Images")
              .get();
          //add products list to client product list
          final imagesList =
              img.docs.map((e) => Images.fromSnapshot(e)).toList();
          prod.image = imagesList;
        }
        i.listProduit = productListe;
        i.listNews = newList;
      }
    } catch (e) {
      print("errorin Firebase : $e");
    }

    return categories;
  }

  //function to create commande
  createCommande(String client, CommandeModel commande) async {
    final commandeRef =
        await _db.collection("Client").doc(client).collection("Commande").add({
      "Date": commande.dateCommande,
      "Etat": commande.etatCommande,
      "qteStock": commande.qteCommande,
      "Adresse": commande.adresseLivraison,
      "PrixTotal": commande.prix
    });
    final newRef = commandeRef.id;
    for (final cmd in commande.produit) {
      final rf = await _db
          .collection("Client")
          .doc(client)
          .collection("Commande")
          .doc(newRef)
          .collection("Pannier")
          .add({
        "qteProduit": cmd.qteProduit,
        "prixTotal": cmd.prixTotal,
      });
      for (final prod in commande.produit.first.produit) {
        var img = await _db
            .collection("Client")
            .doc(client)
            .collection("Commande")
            .doc(newRef)
            .collection("Pannier")
            .doc(rf.id)
            .collection("Produits")
            .add({
          "Nom": prod.nom,
          "Image": prod.imageUrl,
          "Description": prod.description,
          "Prix": prod.prix,
          "Like": false,
          "qteCommande": prod.qteCommande,
        });
        for (final imges in prod.image!) {
          await _db
              .collection("Client")
              .doc(client)
              .collection("Commande")
              .doc(newRef)
              .collection("Pannier")
              .doc(rf.id)
              .collection("Produits")
              .doc(img.id)
              .collection("Images")
              .add({"image": imges.image});
        }
      }
    }
  }

  Future<List<CommandeModel>> getAllCommande(String client) async {
    try {
      final data = await _db
          .collection("Client")
          .doc(client)
          .collection("Commande")
          .get();
      final commandes =
          data.docs.map((e) => CommandeModel.fromSnapshot(e)).toList();

      for (final i in commandes) {
        // Obtenir la liste spécifique des produits de la catégorie à partir de Firebase
        final products = await _db
            .collection("Client")
            .doc(client)
            .collection("Commande")
            .doc(i.firebaseToken)
            .collection('Pannier')
            .get();
        // Ajouter la liste des produits à la liste des produits du client
        final pannierListe =
            products.docs.map((e) => PanierModel.fromSnapshot(e)).toList();
        for (final p in pannierListe) {
          final product = await _db
              .collection("Client")
              .doc(client)
              .collection("Commande")
              .doc(i.firebaseToken)
              .collection('Pannier')
              .doc(p.firebaseToken)
              .collection(productCollection)
              .get();
          // Ajouter la liste des produits à la liste des produits du client
          final produitListe = product.docs
              .map((e) => AchatProduitModel.fromSnapshot(e))
              .toList();
          p.produit = produitListe;
        }
        i.produit = pannierListe;
      }

      return commandes;
    } catch (e) {
      print(e);
      return List.empty();
    }
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
  createPannier(String client, PanierModel pannier) async {
    final pannierRef = await _db
        .collection("Client")
        .doc(client)
        .collection("Pannier")
        .add(
            {'qteProduit': pannier.qteProduit, 'prixTotal': pannier.prixTotal});
    final newRef = pannierRef.id;
    {
      final img = await _db
          .collection("Client")
          .doc(client)
          .collection("Pannier")
          .doc(newRef)
          .collection(productCollection)
          .add({
        "Nom": pannier.produit.last.nom,
        "Image": pannier.produit.last.imageUrl,
        "Description": pannier.produit.last.description,
        "Prix": pannier.produit.last.prix,
        "Like": false,
        "qteCommande": pannier.produit.last.qteCommande,
      });
      for (final imges in pannier.produit.last.image!) {
        await _db
            .collection("Client")
            .doc(client)
            .collection("Pannier")
            .doc(newRef)
            .collection(productCollection)
            .doc(img.id)
            .collection("Images")
            .add({"image": imges.image});
      }
    }
  }

  Future<List<PanierModel>> getAllPannier(String client) async {
    try {
      final data = await _db
          .collection("Client")
          .doc(client)
          .collection("Pannier")
          .get();
      final paniers =
          data.docs.map((e) => PanierModel.fromSnapshot(e)).toList();

      for (final i in paniers) {
        // Obtenir la liste spécifique des produits de la catégorie à partir de Firebase
        final products = await _db
            .collection("Client")
            .doc(client)
            .collection("Pannier")
            .doc(i.firebaseToken)
            .collection(productCollection)
            .get();
        // Ajouter la liste des produits à la liste des produits du client
        final productListe = products.docs
            .map((e) => AchatProduitModel.fromSnapshot(e))
            .toList();
        i.produit = productListe;
      }
      ;

      return paniers;
    } catch (e) {
      return List.empty();
    }
  }

  //function to update pannier
  updatePannier(client, AchatProduitModel pannier, pannierToken) async {
    final img = await _db
        .collection("Client")
        .doc(client)
        .collection("Pannier")
        .doc(pannierToken)
        .collection("Produits")
        .add({
      "Nom": pannier.nom,
      "Image": pannier.imageUrl,
      "Description": pannier.description,
      "Prix": pannier.prix,
      "qteCommande": pannier.qteCommande,
      "Like": false,
    });
    for (final i in pannier.image!) {
      await _db
          .collection("Client")
          .doc(client)
          .collection("Pannier")
          .doc(pannierToken)
          .collection("Produits")
          .doc(img.id)
          .collection("Images")
          .add({"image": i.image});
    }
  }

  deleteProductPannier(client, PanierModel panier, produit) async {
    await _db
        .collection("Client")
        .doc(client)
        .collection("Pannier")
        .doc(panier.firebaseToken)
        .collection(productCollection)
        .doc(produit)
        .delete();
  }

  deletePannier(client, PanierModel panier) async {
    await _db
        .collection("Client")
        .doc(client)
        .collection("Pannier")
        .doc(panier.firebaseToken)
        .delete();
  }

  //function to like product
  addToLike(String client, ProduitModel like) async {
    final img =
        await _db.collection("Client").doc(client).collection("Like").add({
      "Nom": like.nom,
      "Description": like.description,
      "Image": like.imageUrl,
      "Prix": like.prix,
      "qteStock": like.qteStock,
      "Like": like.like,
      "FirebaseToken": like.firebaseToken
    });
    for (final i in like.image!) {
      await _db
          .collection("Client")
          .doc(client)
          .collection("Like")
          .doc(img.id)
          .collection("Images")
          .add({"image": i.image});
    }
  }

  //fuction to get liked product

  Future<List<LikeModel>> getLikedList(String client) async {
    final data =
        await _db.collection("Client").doc(client).collection("Like").get();
    final likes = data.docs.map((e) => LikeModel.fromSnapshot(e)).toList();
    return likes;
  }

  //function to diselike product
  deleteLike(String client, LikeModel like) async {
    await _db
        .collection("Client")
        .doc(client)
        .collection("Like")
        .doc(like.firebaseToken)
        .delete();
  }
}
