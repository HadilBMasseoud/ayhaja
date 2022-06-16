import 'package:flutter/material.dart';

import 'package:work_rate/composant/background.dart';

class Ajouterm extends StatefulWidget {
  const Ajouterm({Key? key}) : super(key: key);

  @override
  State<Ajouterm> createState() => _AjoutermState();
}

class _AjoutermState extends State<Ajouterm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 254, 254),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: SizedBox(
                  width: double.infinity - 20,
                  height: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Positioned(
                          top: 15,
                          left: 5,
                          height: 180,
                          width: 200,
                          child: Center(
                            child: Text(
                              "Ajouter machine ",
                              style: TextStyle(
                                fontFamily: 'OpenSans.ttf',
                                fontSize: 40,
                                color: Color.fromARGB(255, 128, 153, 214),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Marque",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.account_circle),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Model",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.badge_rounded),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /*ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ),
                            );
                            /*login(emailController.text, passController.text);*/
                          },
                          icon: const Icon(
                            Icons.login,
                            size: 18,
                          
                          ),
                          
                          label: const Text("connexion"),
                        ),*/
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "S/N",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.card_travel_rounded),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Positioned(
                          top: 530,
                          height: 50,
                          width: 310,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.save),
                            label: const Text("ajouter"),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10.0),
                              fixedSize: const Size(300, 60),
                              primary: Color(0xFF4773E3),
                              onPrimary: Colors.black,
                              elevation: 5,
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 170, 167, 167),
                                  width: 2),
                              shape: StadiumBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
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
