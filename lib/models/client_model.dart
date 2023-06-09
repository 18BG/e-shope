import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/like_model.dart';

class ClientModel {
  String nom;
  String prenom;
  String username;
  String image;
  String mail;
  String address;
  String telephone;
  String password;
  List<LikeModel>? likes;
  String? firebaseToken;
  String creationDate;

  ClientModel(
      {required this.nom,
      this.likes,
      required this.prenom,
      required this.username,
      required this.image,
      required this.address,
      required this.mail,
      required this.telephone,
      required this.password,
      required this.creationDate,
      this.firebaseToken});

  factory ClientModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    final listLikeData = file!['Like'];
    List<LikeModel>? listLikes;
    if (listLikeData != null) {
      listLikes = List<LikeModel>.from(
          listLikeData.map((element) => LikeModel.fromSnapshot(element)));
    } else {
      listLikes = [];
    }
    return ClientModel(
        firebaseToken: data.id,
        likes: listLikes,
        nom: file["Nom"],
        mail: file["mail"],
        address: file["Addresse"],
        prenom: file["Prenom"],
        username: file["Username"],
        telephone: file["Telephone"],
        password: file["Password"],
        creationDate: file["CreationDate"],
        image: file["Image"]);
  }
}
