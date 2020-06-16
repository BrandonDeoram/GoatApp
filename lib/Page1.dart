import 'package:flutter/material.dart';

class Discover extends StatelessWidget {
  Discover();
  ShapeBorder shape;
  final double height = 50;
  //padding: const EdgeInsets.all(8),
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                SizedBox(
                  height: height,
                  child: Card(
                    color: Colors.white,
                    // This ensures that the Card's children (including the ink splash) are clipped correctly.
                    clipBehavior: Clip.antiAlias,
                    shape: shape,
                    child: Stack(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(40, 130, 0, 0),
                            child: Text('UNC 11\'s',
                                style: TextStyle(color: Colors.black))),
                        Ink.image(
                          image: AssetImage('assets/uncs11.jpg'),
                          child: InkWell(
                            onTap: () {
                              print('Card was tapped');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height,
                  child: Card(
                    color: Colors.white,
                    // This ensures that the Card's children (including the ink splash) are clipped correctly.
                    clipBehavior: Clip.antiAlias,
                    shape: shape,
                    child: Stack(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(40, 130, 0, 0),
                            child: Text('Olive 13\'s',
                                style: TextStyle(color: Colors.black))),
                        Ink.image(
                          image: AssetImage('assets/olive13.jpg'),
                          child: InkWell(
                            onTap: () {
                              print('Card was tapped');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
