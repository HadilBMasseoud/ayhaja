// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Machine _$MachineFromJson(Map<String, dynamic> json) => Machine(
      id: json['_id'] as String?,
      marque: json['marque'] as String?,
      model: json['model'] as String?,
      sn: json['sn'] as String?,
    );

Map<String, dynamic> _$MachineToJson(Machine instance) => <String, dynamic>{
      'marque': instance.marque,
      'model': instance.model,
      'sn': instance.sn,
      '_id': instance.id,
    };
