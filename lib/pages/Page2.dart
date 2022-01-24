import 'package:flutter/material.dart';
import 'package:sample/scrollableCards/top5.dart';
import 'package:sample/widgets/graphics_tees.dart';
import 'package:sample/widgets/just_dropped.dart';

class Drops extends StatelessWidget {
  Drops();
  @override
  Widget build(BuildContext context) {
    //Child to aspect ration for spacing between them
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
              childAspectRatio: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 0,
              crossAxisCount: 1,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Top5(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
