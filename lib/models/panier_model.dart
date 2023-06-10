import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/produit_model.dart';

class PanierModel {
  String? firebaseToken;
  String prixTotal;
  String qteProduit;
  ProduitModel produit;

  PanierModel(
      {required this.produit,
      required this.prixTotal,
      required this.qteProduit,
      this.firebaseToken});

  factory PanierModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    final produitData = file!['Produit'];
    ProduitModel? produit;
    if (produitData != null) {
      produit = ProduitModel.fromSnapshot(produitData);
    }

    return PanierModel(
        firebaseToken: data.id,
        produit: produit!,
        qteProduit: file['qteProduit'],
        prixTotal: file['prixTotal']);
  }
}
