import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/pages/details_page.dart';
import 'package:sample/widgets/shoe_card.dart';

class Discover extends StatelessWidget {
  static const routeName = '/discover';
  List<Product> favMeals = new List<Product>();
  Discover();
  //padding: const EdgeInsets.all(8),
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => ShoeCard(
            product: products[index],
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Details(index)));
            }),
      ),
    );
  }
}
