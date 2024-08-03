// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  int cateId;
  String cateName;
  String? cateImage;

  CategoryModel({
    required this.cateId,
    required this.cateName,
     this.cateImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        cateId: json["cate_id"],
        cateName: json["cate_name"],
        cateImage: json["cate_image"],
      );

  Map<String, dynamic> toJson() => {
        "cate_id": cateId,
        "cate_name": cateName,
        "cate_image": cateImage,
      };
}
