import 'package:flutter/cupertino.dart';

class Clothing {
  final String name;
  final String price;
  final String assetName;

  Clothing(this.name, this.price, this.assetName);
}

List<Clothing> clothings = [
  Clothing('Off-White Logo Short-Sleeve T-Shirt (Black)', 'C\$206',
      'https://image.goat.com/375/attachments/product_template_additional_pictures/images/041/138/733/original/673644_01.jpg.jpeg?1597773009'),
  Clothing('Off-White Mirror Skull Sweatshirt Black', 'C\$375',
      'https://image.goat.com/375/attachments/product_template_additional_pictures/images/041/138/634/original/673656_01.jpg.jpeg?1597772959'),
  Clothing('Supreme Futura Logo Tee Bright Blue', 'C\$75',
      'https://image.goat.com/375/attachments/product_template_additional_pictures/images/041/489/717/original/674976_01.jpg.jpeg?1598374829'),
  Clothing('Supreme Bite Tee Black', 'C\$150',
      'https://image.goat.com/375/attachments/product_template_additional_pictures/images/041/149/216/original/673990_01.jpg.jpeg?1597782879'),
  Clothing('Supreme Pharoah Sanders Tee Cardinal', 'C\$85',
      'https://image.goat.com/375/attachments/product_template_additional_pictures/images/041/489/727/original/674974_01.jpg.jpeg?1598374835'),
  Clothing('Palm Angels Glitter Skate Short-Sleeve T-Shirt Black', 'C\$170',
      'https://image.goat.com/375/attachments/product_template_additional_pictures/images/041/138/624/original/673658_01.jpg.jpeg?1597772951'),
  Clothing('Pleasures Shine Premium Crewneck Heather Grey', 'C\$90',
      'https://image.goat.com/375/attachments/product_template_additional_pictures/images/037/872/366/original/632718_01.jpg.jpeg?1592008576'),
];
