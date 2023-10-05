import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/Image_model.dart';

class LikeModel {
  String nom;
  String description;
  String imageUrl;
  num prix;
  List<Images>? image;
  int qteStock;
  bool like;
  String? firebaseToken;

  LikeModel(
      {required this.description,
      this.image,
      required this.imageUrl,
      required this.like,
      required this.nom,
      required this.prix,
      required this.qteStock,
      this.firebaseToken});
  factory LikeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();

    final listProduitData = file!['Images'];
    List<Images>? listProduit;
    if (listProduitData != null) {
      listProduit = List<Images>.from(
          listProduitData.map((element) => Images.fromSnapshot(element)));
    } else {
      listProduit = [];
    }

    return LikeModel(
        description: file["Description"],
        image: listProduit,
        imageUrl: file["Image"],
        like: file["Like"],
        nom: file["Nom"],
        prix: file["Prix"],
        qteStock: file["qteStock"],
        firebaseToken: data.id);
  }
}
