// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../connexion.dart';
import '../models/user.dart';
import '../provider.dart';
import '../utlisateurs/modifier.dart';

class ListUser extends StatefulWidget {
  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  final Connexion connection = Connexion();
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    controller = ScrollController();
    controller.dispose();
    super.dispose();
    //context.read<MyProvider>().cotroller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AnimatedContainer(
              height: 50.0,
              duration: const Duration(milliseconds: 400),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
                title: const Center(
                  child: Text(
                    'List User',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: connection.listeUser(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    controller: controller,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var currentuser = snapshot.data![index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: pub(currentuser),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  if (snapshot.hasError) {
                    print("${snapshot.error} ******");
                    return const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 82.0,
                      ),
                    );
                  }

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text("Chargement en cours ...")
                      ],
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

  Widget pub(user) {
    return Card(
        elevation: 20,
        shadowColor: Colors.pink.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
          child: SizedBox(
            height: 60,
            width: double.infinity * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${user.nom} ${user.prenom}",
                  style: const TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ModifierU(id: user.id)),
                          ),
                        );
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.filePen,
                        color: Colors.blue.shade300,
                        //size: 10,
                      ),
                    ),
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.trashCan,
                        color: Colors.red,
                        //size: 15,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context, user),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildPopupDialog(BuildContext context, User) {
    return AlertDialog(
      title: const Text('Vous être sûre ?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              connection.deleteuser(User.id);
              Navigator.of(context).pop();
              setState(() {});
            },
            child: const Text(
              "Supprimer",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('fremer'),
          ),
        ],
      ),
    );
  }
}
