import 'package:cloud_firestore/cloud_firestore.dart';

import 'commande_model.dart';

class ReglementModel {
  String numero;
  DateTime date;
  bool etat;
  String? firebaseToken;
  CommandeModel? listProduit;

  ReglementModel(
      {this.listProduit,
      required this.numero,
      required this.date,
      required this.etat,
      this.firebaseToken});

  factory ReglementModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    final commandeData = file!['Commande'];
    CommandeModel? commande;
    if (commandeData != null) {
      commande = CommandeModel.fromSnapshot(commandeData);
    } else {
      commande = null;
    }
    return ReglementModel(
        firebaseToken: data.id,
        numero: file["Numero"],
        date: file["Date"],
        etat: file["Etat"],
        listProduit: commande);
  }
}
