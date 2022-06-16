/*import 'package:json_annotation/json_annotation.dart';*/


import 'package:json_annotation/json_annotation.dart';
import 'package:work_rate/models/user.dart';

import 'Atelier.dart';
import 'machine.dart';

part 'Fiche.g.dart';

@JsonSerializable(explicitToJson: true)
class Fiche {
  final String? num;
  final User? user;
  final Machine? machine;
  final Atelier? atelier;

  @JsonKey(name: '_id')
  final String? id;

  Fiche({
    this.id,
    this.num,
    this.machine,
    this.user,
    this.atelier,
  });

  factory Fiche.fromJson(Map<String, dynamic> json) => _$FicheFromJson(json);
  Map<String, dynamic> toJson() => _$FicheToJson(this);
}
