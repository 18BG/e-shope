import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shope/models/panier_model.dart';
import 'package:e_shope/models/produit_model.dart';

import '../utilities/constants.dart';

class CommandeModel {
  DateTime dateCommande;
  String etatCommande;
  String adresseLivraison;
  num prix;
  String? firebaseToken;
  List<PanierModel> produit;
  num qteCommande;

  CommandeModel(
      {required this.prix,
      required this.produit,
      required this.dateCommande,
      required this.etatCommande,
      required this.adresseLivraison,
      required this.qteCommande,
      this.firebaseToken});

  factory CommandeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    final produitData = file!['Pannier'];
    List<PanierModel>? listProduit;
    if (produitData != null) {
      listProduit = List<PanierModel>.from(
          produitData.map((element) => PanierModel.fromSnapshot(element)));
    } else {
      listProduit = [];
    }
    Timestamp tiemsTamp = file["Date"];
    DateTime date = tiemsTamp.toDate();
    print(date);
    return CommandeModel(
        adresseLivraison: file['Adresse'],
        prix: file['PrixTotal'],
        firebaseToken: data.id,
        dateCommande: date,
        etatCommande: file["Etat"],
        qteCommande: file["qteStock"],
        produit: listProduit);
  }
}
