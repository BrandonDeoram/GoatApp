import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';

class ProductNotifier extends ChangeNotifier {
  final List<Product> _items = [];
  int counter = 0;

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  double get totalPrice {
    double total = 0;
    ;
    for (int i = 0; i < _items.length; i++) {
      total += double.parse(_items[i].price.replaceAll(new RegExp(r'C\$'), ''));
      //print(_cart[i].price.replaceAll(new RegExp(r'C\$'), ''));
    }
    notifyListeners();
    return total;
    
  }

  void add(Product item) {
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(Product item) {
    _items.remove(item);
    notifyListeners();
  }
}
