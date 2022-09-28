import 'package:day_4/models/sub_categories.dart';

class CategoryModel {
  final String id;
  final String title;
  final String image;
  final List<SubCategory> subcategory;

  CategoryModel({
    required this.id,
    required this.image,
    required this.title,
    required this.subcategory,
  });
}
