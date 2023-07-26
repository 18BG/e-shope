import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/produit_model.dart';

class CommandeModel {
  DateTime dateCommande;
  bool etatCommande;
  double prix;
  String? firebaseToken;
  List<ProduitModel> produit;
  int qteCommande;

  CommandeModel(
      {required this.prix,
      required this.produit,
      required this.dateCommande,
      required this.etatCommande,
      required this.qteCommande,
      this.firebaseToken});

  factory CommandeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    final produitData = file!['Produit'];
    List<ProduitModel>? listProduit;
    if (produitData != null) {
      listProduit = List<ProduitModel>.from(
          produitData.map((element) => ProduitModel.fromSnapshot(element)));
    } else {
      listProduit = [];
    }
    return CommandeModel(
        prix: file['PrixTotal'],
        firebaseToken: data.id,
        dateCommande: file["Date"],
        etatCommande: file["Etat"],
        qteCommande: file["qteCommande"],
        produit: produitData);
  }
}
