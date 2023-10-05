import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/Image_model.dart';

class ProduitModel {
  String nom;
  String description;
  num prix;
  List<Images>? image;
  String imageUrl;
  num qteStock;
  String? firebaseToken;
  bool like;

  ProduitModel(
      {required this.nom,
      required this.imageUrl,
      required this.description,
      required this.prix,
      this.image,
      required this.qteStock,
      required this.like,
      this.firebaseToken});

  factory ProduitModel.fromSnapshot(
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
    return ProduitModel(
        firebaseToken: data.id,
        nom: file["Nom"],
        imageUrl: file["Image"],
        qteStock: file["qteStock"],
        description: file["Description"],
        prix: file["Prix"],
        image: listProduit,
        like: file['Like']);
  }
}
