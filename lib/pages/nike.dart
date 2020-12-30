import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/widgets/nikeShoeCard.dart';

//https://img.eukicks.com/storage/2019/04/02013704/Nike-Air-VaporMax-Plus-Black-White-924453-017-Feature-LV-March-29-2019-10-1024x683.jpg
class Nike extends StatelessWidget {
  static const routeName = '/nike';
  final double height = 50;
  ShapeBorder shape;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            height: 150,
            width: 150,
            color: Colors.transparent,
            child: Image.network(
              'https://lh3.googleusercontent.com/proxy/PjqoaSPJRitpkoPvDN4Ri_Zevs6EiQ9dmaPhm3LSWYNI3NbO4CUU1-DadQ9epFgoX7-JqamxoQrY81tmc0XlgS5V-gGkG04a7lQYAED5r--gEaOwiWH3FNJv05NZ3g',
              fit: BoxFit.contain,
            )),
        Container(
            height: 592,
            child: Image.network(
              'https://img.eukicks.com/storage/2019/04/02013704/Nike-Air-VaporMax-Plus-Black-White-924453-017-Feature-LV-March-29-2019-10-1024x683.jpg',
              fit: BoxFit.cover,
            )),
        Container(
            height: 150,
            width: 150,
            color: Colors.transparent,
            child: Image.network(
              'https://lh3.googleusercontent.com/proxy/PjqoaSPJRitpkoPvDN4Ri_Zevs6EiQ9dmaPhm3LSWYNI3NbO4CUU1-DadQ9epFgoX7-JqamxoQrY81tmc0XlgS5V-gGkG04a7lQYAED5r--gEaOwiWH3FNJv05NZ3g',
              fit: BoxFit.contain,
            )),
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              height: 250,
              width: 500,
              child: GridView.builder(
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
    );
  }
}
