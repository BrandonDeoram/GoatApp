import 'package:flutter/material.dart';
import 'package:sample/widgets/Tees.dart';
import 'package:sample/widgets/shoe_card.dart';

class Graphic extends StatelessWidget {
  Graphic();
  @override
  Widget build(BuildContext context) {
    return Column(  
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text('Graphic Tees'),
          padding: EdgeInsets.fromLTRB(0, 0, 260, 0),
        ),
        Container(
          color: Colors.white,
          height: 230,
          width: 500,
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 2,
                  crossAxisCount: 1,
                  children: <Widget>[
                    Tees('assets/RafS.jpeg', 'Raf Simmon ', 'CA\$178'),
                    Tees('assets/CDGN.jpeg', 'CDG Navy ', 'CA\$123'),
                    Tees('assets/SupremeJelly.jpeg', 'Supreme x Undercover ', 'CA\$100'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
