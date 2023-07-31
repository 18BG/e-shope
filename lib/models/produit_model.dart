import 'package:cloud_firestore/cloud_firestore.dart';

class ProduitModel {
  String nom;
  String description;
  num prix;
  String image;
  num qteStock;
  String? firebaseToken;
  bool like;

  ProduitModel(
      {required this.nom,
      required this.description,
      required this.prix,
      required this.image,
      required this.qteStock,
      required this.like,
      this.firebaseToken});

  factory ProduitModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    return ProduitModel(
        firebaseToken: data.id,
        nom: file!["Nom"],
        qteStock: file["qteStock"],
        description: file["Description"],
        prix: file["Prix"],
        image: file["Image"],
        like: file['Like']);
  }
}
