// To parse this JSON data, do
//
//     final unitModel = unitModelFromJson(jsonString);

import 'dart:convert';

List<UnitModel> unitModelFromJson(String str) =>
    List<UnitModel>.from(json.decode(str).map((x) => UnitModel.fromJson(x)));

String unitModelToJson(List<UnitModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitModel {
  int? unitId;
  String? unitName;

  UnitModel({
    this.unitId,
    this.unitName,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        unitId: json["unit_id"],
        unitName: json["unit_name"],
      );

  Map<String, dynamic> toJson() => {
        "unit_id": unitId,
        "unit_name": unitName,
      };
}
