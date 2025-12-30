import 'package:coffee_app/models/category_model.dart';
import 'package:coffee_app/models/product_model.dart';

final List<CategoryModel> categories = [
  CategoryModel(id: 1, name: 'Machiato'),
  CategoryModel(id: 2, name: 'Latte'),
  CategoryModel(id: 3, name: 'Americano'),
];

final List<ProductModel> products = [
  ProductModel(
    id: 1,
    name: 'Caffe Mocha',
    category: categories[1],
    //Latte
    price: 3.99,
    description: 'A delicious blend of espresso, chocolate, and steamed milk.',
    image: 'assets/images/product/cafe_1.png',
    rating: 4.6,
    rateCount: 120,
    sizes: ['Small', 'Medium', 'Large'],
  ),
  ProductModel(
    id: 2,
    name: "Flat White",
    category: categories[1],
    //Latte
    price: 4.00,
    description: "Smooth espresso topped with velvety steamed milk.",
    image: "assets/images/product/cafe_2.png",
    rating: 4.4,
    rateCount: 95,
    sizes: ['Small', 'Medium', 'Large'],
  ),
  ProductModel(
    id: 3,
    name: "Mocha Fusi",
    category: categories[0],
    //Machiato
    price: 5.00,
    description: "A fusion mocha with bold espresso and rich chocolate.",
    image: "assets/images/product/cafe_3.png",
    rating: 4.7,
    rateCount: 85,
    sizes: ['Small', 'Medium', 'Large'],
  ),
  ProductModel(
    id: 4,
    name: "Caffe Panna",
    category: categories[2],
    //Americano
    price: 4.20,
    description: "Espresso infused with hot water.",
    image: "assets/images/product/cafe_4.png",
    rating: 4.2,
    rateCount: 100,
    sizes: ['Small', 'Medium', 'Large'],
  ),

];
