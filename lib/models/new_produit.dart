import 'package:cloud_firestore/cloud_firestore.dart';

class NewProductModel {
  String? id;
  String name;
  num price;
  String description;
  num qteStock;
  String imageUrl;
  DateTime dateAjout;

  NewProductModel(
      {this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imageUrl,
      required this.qteStock,
      required this.dateAjout});

  factory NewProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    Timestamp date = file!["dateAjout"];
    DateTime thisDate = date.toDate();
    return NewProductModel(
        id: data.id,
        name: file["Nom"],
        price: file["Prix"],
        description: file["Description"],
        imageUrl: file["Image"],
        qteStock: file["qteStock"],
        dateAjout: thisDate);
  }
}
