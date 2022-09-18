// ignore_for_file: file_names, non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'Calculations.g.dart';

@JsonSerializable()
class Calculations {
  final int calculationID;
  final String calculationname;
  final List<String> inputFields;
  Calculations(
      {required this.calculationID,
      required this.calculationname,
      required this.inputFields});

  factory Calculations.fromJson(Map<String, dynamic> json) =>
      _$CalculationsFromJson(json);

  Map<String, dynamic> toJson() => _$CalculationsToJson(this);
}
