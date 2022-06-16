import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:work_rate/pages/compte.dart';
import 'package:work_rate/profile.dart';
import 'package:work_rate/provider.dart';

import 'screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: LogIn());
      }),
    );
  }
}
