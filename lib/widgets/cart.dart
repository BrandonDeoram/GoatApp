import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/products.dart';
import 'package:sample/notifiers/ProductNotifier.dart';
import 'package:sample/widgets/cart_card.dart';
import 'package:sample/widgets/shoe_card.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  double total = 0.0;
  @override
  Widget build(BuildContext context) {
    ProductNotifier listShoe = Provider.of<ProductNotifier>(context);
    total = listShoe.totalPrice;

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
      body: Consumer<ProductNotifier>(
        builder: (context, pro, child) {
          return buildBody(listShoe);
        },
      ),
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
                child: Consumer<ProductNotifier>(
                  builder: (context, pro, child) {
                    return Text(
                      "Total: \$" "$total",
                      style: TextStyle(color: Colors.white),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  Container buildContainer(listShoe) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listShoe.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2,
          crossAxisSpacing: 100,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) => CartCard(
          product: listShoe.items[index],
          press: () {},
          index: index,
        ),
      ),
    );
  }

  Widget buildBody(listShoe) {
    if (listShoe.items.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          'Cart is Empty',
          style: TextStyle(fontSize: 20, letterSpacing: 3),
        ),
      );
    } else {
      return buildContainer(listShoe);
    }
  }
}
