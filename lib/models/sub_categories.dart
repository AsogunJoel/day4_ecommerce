import 'package:flutter/material.dart';

class SubCategory with ChangeNotifier {
  final String id;
  final String title;
  final String parentCategory;
  final String image;
  bool dropdown;
  List<SubSubCategory>? subsubcat;

  SubCategory({
    required this.id,
    required this.image,
    required this.parentCategory,
    required this.title,
    this.subsubcat,
    this.dropdown = false,
  });

  toogleDropDown() {
    dropdown = !dropdown;
    notifyListeners();
  }
}

class SubSubCategory {
  final String id;
  final String title;
  final String parentCategory;
  final String image;

  SubSubCategory({
    required this.id,
    required this.image,
    required this.parentCategory,
    required this.title,
  });
}
