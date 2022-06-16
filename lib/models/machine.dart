/*import 'package:json_annotation/json_annotation.dart';*/

import 'package:json_annotation/json_annotation.dart';

part 'machine.g.dart';

@JsonSerializable(explicitToJson: true)
class Machine {
  final String? marque;
  final String? model;
  final String? sn;

  @JsonKey(name: '_id')
  final String? id;

  Machine({
    this.id,
    this.marque,
    this.model,
    this.sn,
  });

  factory Machine.fromJson(Map<String, dynamic> json) =>
      _$MachineFromJson(json);
  Map<String, dynamic> toJson() => _$MachineToJson(this);
}
