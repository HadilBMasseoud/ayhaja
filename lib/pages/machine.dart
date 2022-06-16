import 'package:flutter/material.dart';

import '../composant/background.dart';

class Dashborad extends StatefulWidget {
  const Dashborad({Key? key}) : super(key: key);

  @override
  State<Dashborad> createState() => _DashboradState();
}

class _DashboradState extends State<Dashborad> {
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
                width: 200,
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
                height: 200,
                width: 120,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.card_travel),
                  label: const Text("fiche prevetive"),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 128, 153, 214),
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 360,
                height: 200,
                left: 190,
                width: 125,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.waterfall_chart_rounded),
                  label: const Text("Dashboard"),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 128, 153, 214),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
