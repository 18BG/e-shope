import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String? image;
  bool isUploading = false;

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return isUploading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: height * 0.35,
            //padding: const EdgeInsets.
            //color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Choisissez une nouvelle image de profil",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: height * 0.15,
                    width: height * 0.15,
                    decoration: const BoxDecoration(
                        // color: Colors.amber,
                        ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          "assets/images/b1.png",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          icon: Icon(Icons.camera_enhance)),
                      IconButton(
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          icon: Icon(Icons.photo_library))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Annuler")),
                      ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isUploading = true;
                            });
                            print("Stockage de l'image");
                            File imageFile = File(image!);
                            String fileName = Path.basename(imageFile.path);
                            var imUrl = await uploadImage(imageFile, fileName);
                            print("qqqqqq");
                            print(imUrl);
                            setState(() {
                              isUploading = false;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text("Appliquer")),
                    ],
                  )
                ],
              ),
            ),
          );
  }

  Future getImage(ImageSource source) async {
    var newImage = await ImagePicker().pickImage(source: source);
    setState(() {
      image = newImage!.path;
      print(image);
    });
  }

  Future<String?> uploadImage(File imageFile, String fileName) async {
    try {
      Reference ref = storage.ref().child('images/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Erreur lors du chargement de l\'image : $e');
      return null;
    }
  }
}
