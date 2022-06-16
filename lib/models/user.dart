/*import 'package:json_annotation/json_annotation.dart';*/

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final String? nom;
  final String? prenom;
  final String? email;
  final String? password;
  final String? role;
  @JsonKey(name: '_id')
  final String? id;

  User({
    this.id,
    this.nom,
    this.prenom,
    this.email,
    this.password,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
