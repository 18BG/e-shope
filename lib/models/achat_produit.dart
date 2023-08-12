import 'package:cloud_firestore/cloud_firestore.dart';

class AchatProduitModel {
  String nom;
  String description;
  num prix;
  String image;
  num qteCommande;
  String? firebaseToken;
  bool like;

  AchatProduitModel(
      {required this.nom,
      required this.description,
      required this.prix,
      required this.image,
      required this.qteCommande,
      required this.like,
      this.firebaseToken});

  factory AchatProduitModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    return AchatProduitModel(
        firebaseToken: data.id,
        nom: file!["Nom"],
        qteCommande: file["qteCommande"],
        description: file["Description"],
        prix: file["Prix"],
        image: file["Image"],
        like: file['Like']);
  }
}
