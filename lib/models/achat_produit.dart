import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/Image_model.dart';

class AchatProduitModel {
  String nom;
  String description;
  String imageUrl;
  num prix;
  List<Images>? image;
  num qteCommande;
  String? firebaseToken;
  bool like;

  AchatProduitModel(
      {required this.nom,
      required this.description,
      required this.prix,
      this.image,
      required this.imageUrl,
      required this.qteCommande,
      required this.like,
      this.firebaseToken});

  factory AchatProduitModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();

    final listProduitData = file!['Images'];
    List<Images>? listProduit;
    if (listProduitData != null) {
      listProduit = List<Images>.from(
          listProduitData.map((element) => Images.fromSnapshot(element)));
    } else {
      listProduit = [];
    }

    return AchatProduitModel(
        firebaseToken: data.id,
        nom: file["Nom"],
        imageUrl: file["Image"],
        qteCommande: file["qteCommande"],
        description: file["Description"],
        prix: file["Prix"],
        image: listProduit,
        like: file['Like']);
  }
}
