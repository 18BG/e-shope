import 'package:cloud_firestore/cloud_firestore.dart';

class LikeModel {
  String nom;
  String description;
  num prix;
  String image;
  int qteStock;
  bool like;
  String? firebaseToken;

  LikeModel(
      {required this.description,
      required this.image,
      required this.like,
      required this.nom,
      required this.prix,
      required this.qteStock,
      this.firebaseToken});
  factory LikeModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    return LikeModel(
        description: file!["Description"],
        image: file["Image"],
        like: file["Like"],
        nom: file["Nom"],
        prix: file["Prix"],
        qteStock: file["qteStock"],
        firebaseToken: data.id);
  }
}
