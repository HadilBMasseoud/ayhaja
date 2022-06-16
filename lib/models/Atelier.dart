/*import 'package:json_annotation/json_annotation.dart';*/

import 'package:json_annotation/json_annotation.dart';

part 'Atelier.g.dart';

@JsonSerializable(explicitToJson: true)
class Atelier {
  final String? nomA;

  @JsonKey(name: '_id')
  final String? id;

  Atelier({
    this.id,
    this.nomA,
  });

  factory Atelier.fromJson(Map<String, dynamic> json) =>
      _$AtelierFromJson(json);
  Map<String, dynamic> toJson() => _$AtelierToJson(this);
}
