// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PastPapers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PastPapers _$PastPapersFromJson(Map<String, dynamic> json) => PastPapers(
      id: json['id'] as int,
      name: json['name'] as String,
      subject: json['subject'] as String,
      paper: json['paper'] as int,
      year: json['year'] as int,
      Grade: json['Grade'] as int,
      Month: json['Month'] as String,
      Curriculum: json['Curriculum'] as String,
      Country: json['Country'] as String,
      Language: json['Language'] as String,
    );

Map<String, dynamic> _$PastPapersToJson(PastPapers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subject': instance.subject,
      'paper': instance.paper,
      'year': instance.year,
      'Grade': instance.Grade,
      'Month': instance.Month,
      'Curriculum': instance.Curriculum,
      'Country': instance.Country,
      'Language': instance.Language,
    };
