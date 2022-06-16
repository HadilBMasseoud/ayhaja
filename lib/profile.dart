import 'package:flutter/material.dart';
import 'package:work_rate/pages/compte.dart';
import 'package:work_rate/pages/machine.dart';
import 'package:work_rate/pages/users.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndex = 0;
  final Screen = [
    Compte(),
    const Users(),
    const Dashborad(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 49, 84, 170),
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
            backgroundColor: Color.fromARGB(255, 49, 84, 170),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: "Gestion",
            backgroundColor: Color.fromARGB(255, 49, 84, 170),
          ),
          /* BottomNavigationBarItem(
            icon: Icon(Icons.build_circle),
            label: "machines",
            backgroundColor: Color.fromARGB(255, 49, 84, 170),
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.waterfall_chart_rounded),
            label: "Dashboard",
            backgroundColor: Color.fromARGB(255, 128, 153, 214),
          ),
        ],
      ),
    );
  }
}
