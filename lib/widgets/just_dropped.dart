import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/model/products.dart';
import 'package:sample/widgets/shoe_card.dart';
import 'shoe_card.dart';

class JustDropped extends StatelessWidget {
  JustDropped();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Text('Incoming'),
          padding: EdgeInsets.fromLTRB(0, 0, 290, 0),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          height: 200,
          width: 500,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 4,
              crossAxisCount: 1,
              childAspectRatio: 1.09,
            ),
            itemBuilder: (context, index) => ShoeCard(
              product: products[index],
              press: () {},
            ),
          ),
        ),
      ],
    );
  }
}
