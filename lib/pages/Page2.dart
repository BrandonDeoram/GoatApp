import 'package:flutter/material.dart';
import 'package:sample/widgets/clothing_drop.dart';
import 'package:sample/widgets/graphics_tees.dart';
import 'package:sample/widgets/just_dropped.dart';
import 'package:sample/widgets/long_cards.dart';

class Drops extends StatelessWidget {
  Drops();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
      color: Colors.white,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
            sliver: SliverGrid.count(
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: JustDropped(),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 4,
              mainAxisSpacing: 0,
              crossAxisCount: 1,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Graphic(),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 4,
              mainAxisSpacing: 0,
              crossAxisCount: 1,
              children: <Widget>[
                Container(
                  height: 20,
                  child: Card(
                    borderOnForeground: false,
                    margin:EdgeInsets.fromLTRB(10, 0, 10, 100),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 24.0, left: 6.0, right: 6.0, bottom: 6.0),
                      child: ExpansionTile(
                        title: Text('Birth of Universe'),
                        children: <Widget>[
                          FlatButton(
                            child: Text('Big Bang'),
                            onPressed: () {},
                          ),
                          Text('Birth of the Sun'),
                          Text('Earth is Born'),
                        ],
                      ),
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
