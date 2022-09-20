// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Calculations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calculations _$CalculationsFromJson(Map<String, dynamic> json) => Calculations(
      calculationID: json['calculationID'] as int,
      calculationname: json['calculationname'] as String,
      inputFields: (json['inputFields'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CalculationsToJson(Calculations instance) =>
    <String, dynamic>{
      'calculationID': instance.calculationID,
      'calculationname': instance.calculationname,
      'inputFields': instance.inputFields,
    };
