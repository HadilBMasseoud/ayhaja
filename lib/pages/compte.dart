import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../composant/background.dart';
import '../provider.dart';

class Compte extends StatefulWidget {
  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  @override
  Widget build(BuildContext context) {
    String nom =
        "${Provider.of<MyProvider>(context).nom} ${Provider.of<MyProvider>(context).prenom}";
    String departement = "${Provider.of<MyProvider>(context).departement}";
    String matricule = "${Provider.of<MyProvider>(context).matricule}";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 40,
              child: Image.asset("assets/images/avatar.png", width: 200),
            ),
            Positioned(
              top: 170,
              left: 0,
              height: 220,
              width: 250,
              child: Center(
                child: Text(
                  nom,
                  style: const TextStyle(
                    fontFamily: 'OpenSans.ttf',
                    fontSize: 20,
                    color: Color.fromARGB(255, 49, 84, 170),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 210,
              left: 5,
              height: 220,
              width: 250,
              child: Center(
                child: Text(
                  matricule,
                  style: const TextStyle(
                    fontFamily: 'OpenSans.ttf',
                    fontSize: 20,
                    color: Color.fromARGB(255, 49, 84, 170),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 260,
              left: 50,
              height: 200,
              width: 250,
              child: Center(
                child: Text(
                  departement,
                  style: const TextStyle(
                    fontFamily: 'OpenSans.ttf',
                    fontSize: 20,
                    color: Color.fromARGB(255, 49, 84, 170),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
