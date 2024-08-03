// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_application_1/model/category_model_page.dart';
import 'package:flutter_application_1/model/unit_model_page.dart';

List<ProductListModel> productListModelFromJson(String str) =>
    List<ProductListModel>.from(
        json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
  int proId;
  String proName;
  int cateId;
  int unitId;
  int price;
  int cost;
  String image;
  dynamic imageList;
  CategoryModel category;
  UnitModel unit;

  ProductListModel({
    required this.proId,
    required this.proName,
    required this.cateId,
    required this.unitId,
    required this.price,
    required this.cost,
    required this.image,
    required this.imageList,
    required this.category,
    required this.unit,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        proId: json["pro_id"],
        proName: json["pro_name"],
        cateId: json["cate_id"],
        unitId: json["unit_id"],
        price: json["price"],
        cost: json["cost"],
        image: json["image"],
        imageList: json["image_list"],
        category: CategoryModel.fromJson(json["category"]),
        unit: UnitModel.fromJson(json["unit"]),
      );

  Map<String, dynamic> toJson() => {
        "pro_id": proId,
        "pro_name": proName,
        "cate_id": cateId,
        "unit_id": unitId,
        "price": price,
        "cost": cost,
        "image": image,
        "image_list": imageList,
        "category": category.toJson(),
        "unit": unit.toJson(),
      };
}

