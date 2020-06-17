import 'package:flutter/material.dart';
import './widgets/shoe_card.dart';

class Discover extends StatelessWidget {
  Discover();
  //padding: const EdgeInsets.all(8),
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(5),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                ShoeCard('assets/uncs11.jpg', 'UNC 11\'s'),
                ShoeCard('assets/olive13.jpg', 'Olive 13\'s'),
                ShoeCard('assets/Retro1_Chi.jpg','Chicago 1\'s'),
                ShoeCard('assets/pinncales.jpg','Pinnacles 1\'s'),
                ShoeCard('assets/concords.jpg','Concords 11\'s'),
                ShoeCard('assets/RTravis.jpg','Travis 1\'s'),
                ShoeCard('assets/6Travis.jpg','Travis 6\'s'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
