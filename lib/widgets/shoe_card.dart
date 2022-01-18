import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/pages/details_page.dart';

class ShoeCard extends StatelessWidget {
  final Product product;
  final Function press;
  final double height = 50;
  ShapeBorder shape;
  ShoeCard({Key key, this.product, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        elevation: .5,
        color: Colors.white,
        // This ensures that the Card's children (including the ink splash) are clipped correctly.
        clipBehavior: Clip.antiAlias,
        shape: shape,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                product.price,
                textScaleFactor: .8,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Text(product.name, style: TextStyle(color: Colors.black)),
              alignment: Alignment.center,
            ),
            InkWell(
              child: Container(
                height: 300,
                child: Image.network(product.assetName),
              ),
              onTap: press,
            ),
          ],
        ),
      ),
    );
  }
}
