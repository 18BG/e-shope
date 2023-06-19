import 'dart:io';

import 'package:e_shope/models/client_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

import '../screens/provider.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  String? image;
  bool isUploading = false;

  String? errorMessage;
  late UserProvider userProvider;
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return isUploading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: height * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Choisissez une nouvelle image de profil",
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: height * 0.15,
                    width: height * 0.15,
                    decoration: const BoxDecoration(),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: image != null
                            ? Image.file(
                                File(image!),
                                fit: BoxFit.cover,
                              )
                            : (userProvider.isLoggedIn &&
                                    userProvider.image != "")
                                ? Image.network(
                                    userProvider.image!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/images/b1.png",
                                    fit: BoxFit.cover,
                                  )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          getImage(ImageSource.camera);
                          setState(() {
                            errorMessage = null;
                          });
                        },
                        icon: Icon(Icons.camera_enhance),
                      ),
                      IconButton(
                        onPressed: () {
                          getImage(ImageSource.gallery);
                          setState(() {
                            errorMessage = null;
                          });
                        },
                        icon: Icon(Icons.photo_library),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Annuler"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isUploading = true;
                          });

                          if (image != null) {
                            File imageFile = File(image!);
                            String fileName = Path.basename(imageFile.path);

                            try {
                              String? imageUrl =
                                  await uploadImage(imageFile, fileName);
                              if (imageUrl != null) {
                                ClientModel thisClient = ClientModel(
                                  image: imageUrl,
                                  nom: userProvider.lastName!,
                                  prenom: userProvider.firstName!,
                                  thisusername: userProvider.username!,
                                  addresse: userProvider.address!,
                                  thismail: userProvider.email!,
                                  telephone: userProvider.phoneNumber!,
                                  thispassword: userProvider.password!,
                                  thiscreationDate: userProvider.creation!,
                                  firebaseToken: userProvider.token,
                                );
                                userProvider.updateProvider(thisClient);

                                setState(() {
                                  isUploading = false;
                                });
                                Navigator.pop(context);
                              } else {
                                setState(() {
                                  isUploading = false;
                                  errorMessage =
                                      'Erreur lors du chargement de l\'image';
                                });
                              }
                            } catch (e) {
                              setState(() {
                                isUploading = false;
                                errorMessage =
                                    'Erreur lors du chargement de l\'image : $e';
                              });
                            }
                          } else {
                            setState(() {
                              isUploading = false;
                              errorMessage = 'Aucune image sélectionnée';
                            });
                          }
                        },
                        child: const Text("Appliquer"),
                      ),
                    ],
                  ),
                  if (errorMessage != null)
                    Column(
                      children: [
                        Text(
                          errorMessage!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          "Veuillez choisir une autre image",
                          style: TextStyle(color: Colors.blue, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
  }

  Future getImage(ImageSource source) async {
    try {
      final newImage = await ImagePicker().pickImage(source: source);
      setState(() {
        if (newImage != null) {
          image = newImage.path;
        }
      });
    } on PlatformException catch (e) {
      setState(() {
        errorMessage = 'Erreur lors de la sélection de l\'image: ${e.message}';
      });
    }
  }

  Future<String?> uploadImage(File imageFile, String fileName) async {
    try {
      Reference ref = storage.ref().child('images/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);

      TaskSnapshot taskSnapshot = await uploadTask;

      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Erreur lors du chargement de l\'image : $e');
      return null;
    }
  }
}
