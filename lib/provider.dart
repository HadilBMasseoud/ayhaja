import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  String _id = "";
  String _nom = "";
  String _prenom = "";
  String _matricule = "";
  String _password = "";
  String _role = "";
  String _departement = "";

  /*  late ScrollController _controller;

  ScrollController get cotroller => _controller;
  set cotroller(ScrollController) {
    _controller = cotroller;
    notifyListeners();
  } */

  String get id => _id;
  String get nom => _nom;
  String get prenom => _prenom;
  String get departement => _departement;
  String get password => _password;
  String get matricule => _matricule;
  String get role => _role;

  set id(String id) {
    _id = id;
    notifyListeners();
  }

  set departement(String departement) {
    _departement = departement;
    notifyListeners();
  }

  set nom(String nom) {
    _nom = nom;
    notifyListeners();
  }

  set prenom(String prenom) {
    _prenom = prenom;
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  set role(String role) {
    _role = role;
    notifyListeners();
  }

  set matricule(String matricule) {
    _matricule = matricule;
    notifyListeners();
  }

  void updateUser(String _nom, String _prenom) {
    nom = _nom;
    prenom = _prenom;
    notifyListeners();
  }
}
