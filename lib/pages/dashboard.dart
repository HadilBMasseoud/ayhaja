import 'package:flutter/material.dart';

import '../composant/background.dart';
import '../machine/ajouterm.dart';
import '../machine/supprimerm.dart';

class Machine extends StatefulWidget {
  const Machine({Key? key}) : super(key: key);

  @override
  State<Machine> createState() => _DashboradState();
}

class _DashboradState extends State<Machine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const Positioned(
              top: 20,
              left: 5,
              height: 150,
              width: 18,
              child: Center(
                child: Text(
                  "Gestion des utilisateurs",
                  style: TextStyle(
                    fontFamily: 'OpenSans.ttf',
                    fontSize: 40,
                    color: Color.fromARGB(255, 128, 153, 214),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 190,
              left: 60,
              height: 160,
              width: 120,
              child: ElevatedButton(
                /*icon: const Icon(Icons.supervised_user_circle_sharp),*/
                child: const Text("Ajouter "),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ajouterm(),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 190,
              height: 200,
              left: 190,
              width: 120,
              child: ElevatedButton(
                /*icon: const Icon(Icons.supervised_user_circle_sharp),*/
                child: const Text("Supprimer "),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Supprimerm(),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 360,
              height: 200,
              width: 120,
              left: 60,
              child: ElevatedButton(
                /*icon: const Icon(Icons.supervised_user_circle_sharp),*/
                child: const Text("Modifier"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  /* Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mo(),
                    ),
                  );*/
                },
              ),
            ),
            Positioned(
              top: 400,
              left: 190,
              height: 160,
              width: 120,
              child: ElevatedButton(
                /*icon: const Icon(Icons.supervised_user_circle_sharp),*/
                child: const Text("Lister "),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Supprimerm(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
