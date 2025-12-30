import 'package:coffee_app/models/category_model.dart';

class ProductModel {
  int id;
  String name;
  CategoryModel category;
  double price;
  String description;
  String image;
  double rating;
  int rateCount;
  List<String> sizes;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.rateCount,
    required this.sizes,
  });
}
