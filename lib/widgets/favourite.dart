import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';

class Favourite extends StatefulWidget {
  List <Product> list;
  Favourite(this.list);
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}