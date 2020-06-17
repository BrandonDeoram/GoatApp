import 'package:flutter/material.dart';

class ShoeCard extends StatelessWidget {
  final String imagepath;
  final String imagename;
  final double height = 50;
  ShapeBorder shape;
  ShoeCard(this.imagepath,this.imagename);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        elevation: 0.4,
        color: Colors.white,
        // This ensures that the Card's children (including the ink splash) are clipped correctly.
        clipBehavior: Clip.antiAlias,
        shape: shape,
        child: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(40, 130, 0, 0),
                child:
                    Text(imagename, style: TextStyle(color: Colors.black))),
            Ink.image(
              image: AssetImage(imagepath),
              child: InkWell(
                onTap: () {
                  print('Card was tapped');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
