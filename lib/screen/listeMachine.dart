// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../connexion.dart';
import '../models/machine.dart';
import '../models/user.dart';
import '../provider.dart';
import '../utlisateurs/modifier.dart';

class ListMachine extends StatefulWidget {
  @override
  State<ListMachine> createState() => _ListMachineState();
}

class _ListMachineState extends State<ListMachine> {
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
                    'List Machine',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: connection.listeMachine(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Machine>> snapshot) {
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

  Widget pub(machine) {
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
                Column(
                  children: [
                    Text(
                      "${machine.marque} ",
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text("${machine.model}")
                  ],
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
                          _buildPopupDialog(context, machine),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildPopupDialog(BuildContext context, machine) {
    return AlertDialog(
      title: const Text('Vous être sûre ?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              connection.deletemachine(machine.id);
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
