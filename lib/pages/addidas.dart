import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sample/widgets/addidasShoeCard.dart';
import 'package:sample/model/products.dart';
import 'package:sample/widgets/bottom_items.dart';

class Addidas extends StatelessWidget {
  static const routeName = '/addidas';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          actions: [
            Container(
                height: 20,
                child: Image.network(
                  'https://i.pinimg.com/originals/b6/e2/ef/b6e2ef894ef8e63a8a3e8c35a6e6144a.png',
                  fit: BoxFit.fitHeight,
                )),
          ],
          backgroundColor: Colors.white,
          shadowColor: Colors.red.shade900,
        ),
        bottomNavigationBar: BottomItems(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 250,
                child: Swiper(
                  itemBuilder: (context, index) => AddidasShoeCard(
                    product: addidasSneakers[index],
                    press: () {},
                  ),
                  itemCount: addidasSneakers.length,
                  viewportFraction: .8,
                  scale: .9,
                ),
              ),
            ],
          ),
        ));
  }
}
