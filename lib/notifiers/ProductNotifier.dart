import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';

class ProductNotifier extends ChangeNotifier {
  final List<Product> _items = [];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < _items.length; i++) {
      total += double.parse(_items[i].price.replaceAll(new RegExp(r'C\$'), ''));
    }

    return total;
  }

  void add(Product item) {
    if (items.contains(item)) {
      item.quantity++;
      notifyListeners();
    } else {
      _items.add(item);
      item.quantity = 1;
      // _items[index].quantity++;
      notifyListeners();
    }
  }

  void deleteItem(Product item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int getQuantity(Product item) {
    return item.quantity;
  }
}
