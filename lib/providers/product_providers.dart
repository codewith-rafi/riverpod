import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_tutorial/models/product.dart';
part 'product_providers.g.dart';

const List<Product> allProducts = [
  Product(id: '1', title: 'Red Backpack', price: 9.99, image: 'assets/products/backpack.png'),
  Product(id: '2', title: 'Blue Drum', price: 19.99, image: 'assets/products/drum.png'),
  Product(id: '3', title: 'Green Guitar', price: 29.99, image: 'assets/products/guitar.png'),
  Product(id: '4', title: 'Black Jeans', price: 39.99, image: 'assets/products/jeans.png'),
  Product(id: '5', title: 'Yellow Shorts', price: 49.99, image: 'assets/products/shorts.png'),
  Product(id: '6', title: 'Pink Skates', price: 59.99, image: 'assets/products/skates.png'),
  Product(id: '7', title: 'Blue Suitcase', price: 69.99, image: 'assets/products/suitcase.png'),
];

// final productsProvider = Provider((ref) {
//   return allProducts;
// });

// final reducedProductsProvider = Provider((ref) {
//   return allProducts.where((p) => p.price < 50).toList();
// });

// generated providers

@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> reducedProducts(ref) {
  return allProducts.where((p) => p.price < 50).toList();
}