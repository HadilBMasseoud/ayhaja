// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Fiche.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fiche _$FicheFromJson(Map<String, dynamic> json) => Fiche(
      id: json['_id'] as String?,
      num: json['num'] as String?,
      machine: json['machine'] == null
          ? null
          : Machine.fromJson(json['machine'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FicheToJson(Fiche instance) => <String, dynamic>{
      'num': instance.num,
      'user': instance.user?.toJson(),
      'machine': instance.machine?.toJson(),
      '_id': instance.id,
    };
