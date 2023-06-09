import 'package:cloud_firestore/cloud_firestore.dart';

class ActuModel {
  String titre;
  String description;
  String? firebaseToken;

  ActuModel(
      {required this.titre, required this.description, this.firebaseToken});

  factory ActuModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    return ActuModel(
      firebaseToken: data.id,
      titre: file!["Nom"],
      description: file["Description"],
    );
  }
}
