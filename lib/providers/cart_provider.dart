import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // initial value
  @override
  Set<Product> build() {
    return {
      Product(id: '1', title: 'Red Backpack', price: 9.99, image: 'assets/products/backpack.png'),
    };
  }

  // methods to update state
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(
  () => CartNotifier(),
);