import 'dart:collection';

import 'package:flutter/material.dart';

import '../composant/background.dart';
import '../machine/ajouterm.dart';
import '../screen/listeMachine.dart';
import '../screen/listeUser.dart';
import '../utlisateurs/ajouter.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
              height: 180,
              width: 180,
              child: Center(
                child: Text(
                  "Gestion ",
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
                child: const Text("Ajouter utilisateur "),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ajouterU(),
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
                child: const Text("Modifier machine "),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListMachine(),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 190,
              height: 200,
              width: 120,
              left: 190,
              child: ElevatedButton(
                /*icon: const Icon(Icons.supervised_user_circle_sharp),*/
                child: const Text("ajouter machine "),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Ajouterm(),
                    ),
                  );
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
                child: const Text("Modifier Utilisateur"),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 128, 153, 214),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListUser(),
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
