import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';

class AddidasShoeCard extends StatelessWidget {
  final Product product;
  final Function press;

  ShapeBorder shape;
  AddidasShoeCard({Key key, this.product, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 1.5,
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
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child:
                  Text(product.name, style: TextStyle(color: Colors.grey[900])),
              alignment: Alignment.bottomLeft,
            ),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
                  height: 400,
                  width: 200,
                  child: Image.network(
                    product.assetName,
                    fit: BoxFit.contain,
                  ),
                ),
                onTap: press,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
