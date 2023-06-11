import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bg {
  static const String app_name = "Citizen Safety";
  static const String app_version = "Version 1.0.0";
  static const int app_version_code = 1;
  static const String app_color = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static Color customPurple = Colors.purple;
  static const String google_sans_family = "GoogleSans";
  static bool isDebugMode = false;
  static const apiUrl = 'http://185.98.139.77:9090/api-opereli';
  static const webUrl = 'https://Dadledger.com/Dadledger/';

  //* Images
  static const String welcome_img = "assets/images/group_presentation.png";
  static const String lock_img = "assets/images/password.png";

  //*  Texts
  static const String loginNote =
      "Manage your suppliers, customers, expenses, cash flow, payroll and inventory amongst other business activities from anywhere";
  static const String loading_text = "Chargement...";
  static const String try_again_text = "Réessayer";
  static const String some_error_text = "Une erreur";
  static const String signInText = "S'identifier";
  static const String signUpText = "S'inscrire";
  static const String forgetPasswordText = "Mot de passe oublié?";
  static const String resetText = "réinitialiser le mot de passe";
  static const String wrongText = "Quelque chose s'est mal passé";
  static const String confirmText = "Confirmer";
  static const String supportText = "Soutien nécessaire";
  static const String featureText = "Demande de fonctionnalité";
  static const String moreFeatureText = "Plus de fonctionnalités à venir.";
  static const String updateNowText =
      "Veuillez mettre à jour votre application pour une expérience fluide.";
  static const String checkNetText =
      "Il semble que votre connexion Internet ne soit pas active.";

  //* ActionTexts

  //* Preferences
  static SharedPreferences? prefs;

  //*  SQLite

  static String? validateName(String? value) {
    // Nigeria Mobile number are of 11 digit only
    if (value!.length < 3)
      return 'Entrez un caractère de nom valide';
    else
      return null;
  }

  static String? validateNumber(String? value) {
    // Nigeria Mobile number are of 11 digit only
    if ((value! is int))
      return 'Entrez un caractère de nom valide';
    else
      return null;
  }

  static String? validatePassword(String? value) {
    if (value!.length < 6)
      return 'Le mot de passe doit comporter 6 caractères ou plus';
    else
      return null;
  }

  //* Function
  static String? validateMobile(String? value) {
    // Nigeria Mobile number are of 11 digit only
    if (value!.length < 7)
      return 'Le numéro de mobile doit être composé au moins 8 chiffres';
    else
      return null;
  }

  static String? validateUsername(String? value) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // //RegExp regex = new RegExp(pattern.toString());
    if (value!.length < 3 /* || !regex.hasMatch(value!)*/)
      return 'Entrez une nom d\'utilisateur valide';
    else
      return null;
  }

  static String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value!))
      return 'Entrez une adresse email valide';
    else
      return null;
  }

  static bool isValidName(String value) {
    // Nigeria Mobile number are of 11 digit only
    if (value.length < 3 ||
        value.trim().contains(RegExp(r'[\s!@#$%^&*(),.?":{}|<>]')))
      return false;
    else
      return true;
  }

  static bool isValidEmail(value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool isValidPassword(String value) {
    if (value.length < 6)
      return false;
    else
      return true;
  }

  static String createQueryString(
      {String? table, Map<String, dynamic>? columnData, String? primaryKey}) {
    String table = 'user';
    var buffer = new StringBuffer();
    buffer.write('CREATE TABLE IF NOT EXISTS $table(');
    //create table if not exist
    columnData!.forEach((key, value) {
      //check for primary key first
      if (key.toLowerCase() == primaryKey!.toLowerCase()) {
        buffer.write('$key integer primary key autoincrement,');
      } else {
        (value != null && value is String)
            ? buffer.write('$key text not null,')
            : buffer.write('$key integer not null,');
      }
    });
    //close
    buffer.write(')');
    return buffer.toString();
  }

  static showToast({String? msg, String? toastType}) {
    Map<String, Color> type = {
      'error': Colors.red,
      'success': Colors.green,
      'info': Colors.blue,
      'warning': Colors.yellow,
      'default': Colors.black54
    };

    Fluttertoast.showToast(
        msg: msg!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: toastType != null ? type[toastType] : type['default'],
        textColor: Colors.white,
        fontSize: 16.0);
  }
}


// Build android version
//flutter build apk --split-per-abi --no-sound-null-safety
//flutter install


//Deploy to play Store
//Run flutter build appbundle --no-sound-null-safety



//Deploy to appStore
//Run flutter build ipa --no-sound-null-safety to produce an Xcode build archive.
//open build/ios/archive/MyApp.xcarchive in Xcode.
//Click the Validate App button
//After the archive has been successfully validated, click Distribute App.
//open -a Simulator
//open ios/Runner.xcworkspace
