import 'package:cloud_firestore/cloud_firestore.dart';

class Images {
  String? token;
  String image;
  Images({required this.image, token});
  factory Images.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data) {
    final file = data.data();
    return Images(
      token: data.id,
      image: file!["image"],
    );
  }
}
