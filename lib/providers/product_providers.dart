import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/models/product.dart';

const List<Product> allProducts = [
  Product(id: '1', title: 'Red Backpack', price: 9.99, image: 'backpack.png'),
  Product(id: '2', title: 'Blue Drum', price: 19.99, image: 'drum.png'),
  Product(id: '3', title: 'Green Guitar', price: 29.99, image: 'guitar.png'),
  Product(id: '4', title: 'Black Jeans', price: 39.99, image: 'jeans.png'),
  Product(id: '5', title: 'Yellow Shorts', price: 49.99, image: 'shorts.png'),
  Product(id: '6', title: 'Pink Skates', price: 59.99, image: 'skates.png'),
  Product(id: '7', title: 'Blue Suitcase', price: 69.99, image: 'suitcase.png'),
];

final productsProvider = Provider((ref) {
  return allProducts;
});