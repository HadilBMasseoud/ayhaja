import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../composant/background.dart';
import '../profile.dart';
import '../provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final passController = TextEditingController();
  final matriculeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 254, 254),
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              component1(Icons.email, "Matricule...", false, true,
                  matriculeController),
              const SizedBox(
                height: 45,
              ),
              component1(Icons.lock_clock_outlined, "Mot de pass", true, false,
                  passController),
              const SizedBox(
                height: 45,
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
              Positioned(
                top: 530,
                height: 50,
                width: 310,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text("connexion"),
                  onPressed: () {
                    login(matriculeController.text, passController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10.0),
                    fixedSize: const Size(300, 60),
                    primary: const Color(0xFF4773E3),
                    onPrimary: Colors.black,
                    elevation: 5,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 170, 167, 167), width: 2),
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget component1(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 50,
          sigmaX: 10,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.3,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(19),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(color: Colors.black.withOpacity(.5)),
            cursorColor: Colors.white,
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.black.withOpacity(.5),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(String Matricule, String password) async {
    if (Matricule.isNotEmpty && password.isNotEmpty) {
      var response =
          await http.post(Uri.parse("http://192.168.1.22:8999/login"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode({'matricule': Matricule, 'password': password}));
      var user = jsonDecode(response.body)["user"];
      if (response.statusCode == 200) {
        context.read<MyProvider>().id = user["_id"];
        context.read<MyProvider>().nom = user["nom"];
        context.read<MyProvider>().prenom = user["prenom"];
        context.read<MyProvider>().role = user["role"];
        context.read<MyProvider>().departement = user["departement"];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid Credentials."),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Black Field Not Allowed"),
        ),
      );
    }
  }
}
