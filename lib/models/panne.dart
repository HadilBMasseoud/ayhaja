/*import 'package:json_annotation/json_annotation.dart';*/

import 'package:json_annotation/json_annotation.dart';

part 'panne.g.dart';

@JsonSerializable(explicitToJson: true)
class Panne {
  final String? nom;

  @JsonKey(name: '_id')
  final String? id;

  Panne({
    this.id,
    this.nom,
  });

  factory Panne.fromJson(Map<String, dynamic> json) => _$PanneFromJson(json);
  Map<String, dynamic> toJson() => _$PanneToJson(this);
}
