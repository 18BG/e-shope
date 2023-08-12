import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/produit_model.dart';
import 'package:e_shope/utilities/constants.dart';

import 'achat_produit.dart';

class PanierModel {
  String? firebaseToken;
  num prixTotal;
  num qteProduit;
  List<AchatProduitModel> produit;

  PanierModel(
      {required this.produit,
      required this.prixTotal,
      required this.qteProduit,
      this.firebaseToken});

  factory PanierModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    final produitData = file![productCollection];
    List<AchatProduitModel> produit;
    if (produitData != null && produitData.isNotEmpty) {
      produit = List<AchatProduitModel>.from(produitData
          .map((element) => AchatProduitModel.fromSnapshot(element)));
    } else {
      produit = [];
      // Gérer le cas où la liste est vide ou null
      //produit = ProduitModel(); // Remplacez par l'instanciation appropriée de ProduitModel
    }

    return PanierModel(
        firebaseToken: data.id,
        qteProduit: file['qteProduit'],
        produit: produit, // Utilisez une valeur par défaut si produit est null
        prixTotal: file['prixTotal']);
  }
}
