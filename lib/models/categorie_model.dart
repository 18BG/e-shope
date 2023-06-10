import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/produit_model.dart';

class CategorieModel{
  String nom;
  String description;
  String? firebaseToken;
  List<ProduitModel>? listProduit;

  CategorieModel({
    this.listProduit,
    required this.nom,
    required this.description,
    this.firebaseToken});

    factory CategorieModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data){
      final file = data.data();
  final listProduitData = file!['Produits'];
  List<ProduitModel>? listProduit;
  if (listProduitData != null) {
    listProduit = List<ProduitModel>.from(listProduitData.map(
        (element) => ProduitModel.fromSnapshot(element)));
  } else {
    listProduit = [];
  }
      return CategorieModel(
        firebaseToken: data.id,
        nom: file["Nom"],
        description: file["Description"],
        listProduit: listProduit
        );
    }
}
