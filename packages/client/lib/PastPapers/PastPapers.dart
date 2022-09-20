// ignore_for_file: file_names, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'PastPapers.g.dart';

@JsonSerializable()
class PastPapers {
  final int id;
  final String name;
  final String subject;
  final int paper;
  final int year;
  final int Grade;
  final String Month;
  final String Curriculum;
  final String Country;
  final String Language;

  PastPapers({
    required this.id,
    required this.name,
    required this.subject,
    required this.paper,
    required this.year,
    required this.Grade,
    required this.Month,
    required this.Curriculum,
    required this.Country,
    required this.Language,
  });

  factory PastPapers.fromJson(Map<String, dynamic> json) =>
      _$PastPapersFromJson(json);

  Map<String, dynamic> toJson() => _$PastPapersToJson(this);
}
