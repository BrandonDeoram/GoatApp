import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/widgets/bottom_items.dart';
import 'package:sample/widgets/nikeShoeCard.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//https://img.eukicks.com/storage/2019/04/02013704/Nike-Air-VaporMax-Plus-Black-White-924453-017-Feature-LV-March-29-2019-10-1024x683.jpg
class Nike extends StatefulWidget {
  @override
  _NikeState createState() => _NikeState();
}

class _NikeState extends State<Nike> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(actions: [
        Container(
            height: 20,
            child: Image.network(
              'https://cdn.freebiesupply.com/logos/large/2x/nike-4-logo-black-and-white.png',
              fit: BoxFit.fitHeight,
            )),
      ], backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 180,
            child: Swiper(
              itemBuilder: (context, index) => NikeShoeCard(
                product: nikeSneakers[index],
                press: () {},
              ),
              itemCount: nikeSneakers.length,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              12,
              10,
              0,
              0,
            ),
            alignment: Alignment.centerLeft,
            child: Text("Casual"),
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 200,
                    width: 500,
                    child: GridView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: nikeSneakers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1,
                        childAspectRatio: 1.09,
                      ),
                      itemBuilder: (context, index) => NikeShoeCard(
                        product: nikeSneakers[index],
                        press: () {},
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: BottomItems(),
      extendBody: true,
    );
  }
}
