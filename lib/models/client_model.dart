import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/commande_model.dart';
import 'package:e_shope/models/like_model.dart';
import 'package:e_shope/models/panier_model.dart';

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
  List<CommandeModel>? commandes;
  List<PanierModel>? panniers;
  String? firebaseToken;
  String creationDate;

  ClientModel(
      {required this.nom,
      this.panniers,
      this.likes,
      this.commandes,
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
    //to fetch client like liste
    final listLikeData = file!['Like'];
    List<LikeModel>? listLikes;
    if (listLikeData != null) {
      listLikes = List<LikeModel>.from(
          listLikeData.map((element) => LikeModel.fromSnapshot(element)));
    } else {
      listLikes = [];
    }
    //to fetch client Commandes liste
    final listCommandeData = file['Commande'];
    List<CommandeModel>? listCommandes;
    if (listCommandeData != null) {
      listCommandes = List<CommandeModel>.from(
          listCommandeData.map((element) => LikeModel.fromSnapshot(element)));
    } else {
      listCommandes = [];
    }
    //to fetch client panniers liste
    final listPannierData = file['Pannier'];
    List<PanierModel>? listPanniers;
    if (listPannierData != null) {
      listPanniers = List<PanierModel>.from(
          listPannierData.map((element) => LikeModel.fromSnapshot(element)));
    } else {
      listPanniers = [];
    }
    return ClientModel(
        firebaseToken: data.id,
        likes: listLikes,
        commandes: listCommandes,
        panniers: listPanniers,
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
