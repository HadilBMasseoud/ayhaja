import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/Fiche.dart';
import 'models/machine.dart';
import 'models/user.dart';

String x = "http://192.168.1.22:8999";

class Connexion {
  Future<List<User>> listeUser() async {
    var response = await http.get(Uri.parse('$x/admin/user'), headers: {
      "Access-Control-Allow-Origin": "*",
      // Required for CORS support to work
      "Access-Control-Allow-Credentials": 'true',
      // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
    if (response.statusCode == 200) {
      Map userData = jsonDecode(response.body);
      List<dynamic> users = (userData['response'] as List);
      return users.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }

  Future<http.Response> deleteuser(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$x/admin/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  Future<http.Response> updateUser(
    String id,
    String departement,
  ) {
    return http.put(
      Uri.parse('$x/profile/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'departement': departement,
      }),
    );
  }

//machine
  Future<List<Machine>> listeMachine() async {
    var response = await http.get(Uri.parse('$x/admin/machine'), headers: {
      "Access-Control-Allow-Origin": "*",
      // Required for CORS support to work
      "Access-Control-Allow-Credentials": 'true',
      // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
    if (response.statusCode == 200) {
      Map userData = jsonDecode(response.body);
      List<dynamic> machines = (userData['response'] as List);
      return machines.map((json) => Machine.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }

  Future<http.Response> deletemachine(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$x/admin/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  Future<http.Response> updatemachine(
    String id,
    String departement,
  ) {
    return http.put(
      Uri.parse('$x/profile/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'departement': departement,
      }),
    );
  }

  //fiche

  Future<List<Fiche>> listeFiche() async {
    var response = await http.get(Uri.parse('$x/admin/Fiche'), headers: {
      "Access-Control-Allow-Origin": "*",
      // Required for CORS support to work
      "Access-Control-Allow-Credentials": 'true',
      // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });
    if (response.statusCode == 200) {
      Map userData = jsonDecode(response.body);
      List<dynamic> fiches = (userData['response'] as List);
      return fiches.map((json) => Fiche.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }

  Future<http.Response> deleteFiche(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('$x/admin/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }

  Future<http.Response> updateFiche(
    String id,
    String departement,
  ) {
    return http.put(
      Uri.parse('$x/profile/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'departement': departement,
      }),
    );
  }
}
