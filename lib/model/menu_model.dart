import 'package:flutter/material.dart';

class MenuModel {
  int id;
  String title;
  Icon icon;
  Widget page;

  MenuModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.page,
  });
}
