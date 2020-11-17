import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/widgets/cart_card.dart';
import 'package:sample/widgets/shoe_card.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  final List<Product> _cart;
  Cart(this._cart);
  double total = 0.0;
  
  double getTotal() {
    //Turning price into a double , getting total of items
    for (int i = 0; i < _cart.length; i++) {
      total += double.parse(_cart[i].price.replaceAll(new RegExp(r'C\$'), ''));
      //print(_cart[i].price.replaceAll(new RegExp(r'C\$'), ''));
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    total = getTotal();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Container(
          padding: const EdgeInsets.only(left: 75),
          child: Text(
            'Cart',
            style: TextStyle(letterSpacing: 2, fontStyle: FontStyle.normal),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: buildBody(),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          color: Colors.black,
        ),
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                "Total: \$" "$total",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: _cart.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisSpacing: 100,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) => CartCard(
          product: _cart[index],
          press: () {},
          cart: _cart,
          index: index,
        ),
      ),
    );
  }

  Widget buildBody() {
    if (_cart.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          'Cart is Empty',
          style: TextStyle(fontSize: 20, letterSpacing: 3),
        ),
      );
    } else {
      return buildContainer();
    }
  }
}
