import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/new_produit.dart';
import 'package:e_shope/models/produit_model.dart';

class CategorieModel {
  String nom;
  String? image;
  String description;
  String? firebaseToken;
  List<ProduitModel>? listProduit;
  List<NewProductModel>? listNews;

  CategorieModel(
      {this.listProduit,
      this.listNews,
      this.image,
      required this.nom,
      required this.description,
      this.firebaseToken});

  factory CategorieModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    final listProduitData = file!['Produits'];
    List<ProduitModel>? listProduit;
    if (listProduitData != null) {
      listProduit = List<ProduitModel>.from(
          listProduitData.map((element) => ProduitModel.fromSnapshot(element)));
    } else {
      listProduit = [];
    }
    final newListProduitData = file['newProducts'];
    List<NewProductModel>? newList;

    if (newListProduitData != null) {
      newList = List<NewProductModel>.from(newListProduitData
          .map((element) => NewProductModel.fromSnapshot(element)));
    } else {
      newList = [];
    }

    return CategorieModel(
        firebaseToken: data.id,
        nom: file["Nom"],
        description: file["Description"],
        image: file["Image"],
        listNews: newList,
        listProduit: listProduit);
  }
}
