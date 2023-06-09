import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/produit_model.dart';

class PanierModel {
  String? firebaseToken;
  String prixTotal;
  String qteProduit;
  List<ProduitModel>? listProduit;

  PanierModel(
      {this.listProduit,
      required this.prixTotal,
      required this.qteProduit,
      this.firebaseToken});

  factory PanierModel.fromSnapshot(
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
    return PanierModel(firebaseToken: data.id, listProduit: listProduit);
  }
}
