import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String nom;
  String message;
  String? firebaseToken;

  ContactModel(
      {required this.nom,
      required this.message,
      this.firebaseToken});

  factory ContactModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    return ContactModel(
        firebaseToken: data.id,
        nom: file!["Nom"],
        message: file["Message"]);
  }
}
