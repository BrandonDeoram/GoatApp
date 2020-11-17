import 'package:flutter/material.dart';

class Product {
  //Somehting that every product must contain
  final String assetName;
  final String name;
  final String price;
  final String descript;
  final String id;

  Product(this.assetName, this.name, this.price, this.descript, this.id);
}

List<Product> products = [
  Product(
      'https://stockx.imgix.net/Air-Jordan-11-Retro-Low-University-Blue-Product.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&q=90&dpr=2&trim=color&updated_at=1546585258',
      'UNC 11\'s',
      'C\$175',
      'Released in April of 2017, the Air Jordan 11 Retro Low ‘UNC’ is based on the 2001 Air Jordan 11 Retro Low ‘Columbia’ that dropped alongside the Air Jordan 11 Retro Low ‘Cherry.’ The design combines a North Carolina Tar Heels-inspired white mesh upper with university blue leather overlays, and an ice blue translucent outsole. Unlike the release in 2001, the 2017 release retails in full family sizes.',
      'c1'),
  Product(
      'https://stockx-360.imgix.net//Air-Jordan-13-Retro-Olive/Images/Air-Jordan-13-Retro-Olive/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1544832715&w=1000',
      'Olive 13\'s',
      'C\$365',
      'Joining a small selection of Air Jordans sporting an ‘Olive’ colorway, this Air Jordan 13 Retro marks the first time a shoe other than the Air Jordan 9 gets the treatment. Featuring the signature color on the base, heel and ankle hologram, the rest of the upper is made up of black suede. True Red Jumpman branding on the tongue provides a pop, also appearing on the outsole.',
      'c2'),
  Product(
      'https://image.goat.com/crop/375/attachments/product_template_additional_pictures/images/008/487/292/original/13641_01.jpg.jpeg?1513115108',
      'Chicago 1\'s',
      'C\$984',
      'The Nike Air Jordan 1 Retro Chicago 2013 is the second reissue of the iconic Chicago colorway first released in 1985. The Retro swaps out the OG red Nike Air tongue label for Jordan branding that also appears at the heel. In 2015, the sneaker was remastered in OG form, restoring the red Nike Air tongue label and removing the Jumpman branding on the heel.',
      'c3'),
  Product(
      'https://stockx-360.imgix.net//Air-Jordan-1-Retro-Pinnacle-White/Images/Air-Jordan-1-Retro-Pinnacle-White/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1554086232&w=1000',
      'Pinnacles 1\'s',
      'C\$523',
      'The Nike Air Jordan 1 Retro High OG Pinnacle features a premium white leather upper with a stingray-skin pattern, white laces, and a white sole. Released in July of 2015, the design also includes 24k gold accents on the tongue, eyelets, lace-locks, heel, and wings logo.',
      'c4'),
  Product(
      'https://stockx-360.imgix.net//Air-Jordan-11-Retro-Concord-2018/Images/Air-Jordan-11-Retro-Concord-2018/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1566585772&w=1000',
      'Concords 11\'s',
      'C\$462',
      'The 2018 edition of the Air Jordan 11 Retro ‘Concord’ features ‘45’ stamped on the black heel tab—a nod to the jersey number that Michael Jordan wore upon his return to basketball following his first retirement. The rest of the build keeps the shoe’s signature details intact, including a white ballistic mesh upper, black patent leather overlays and an icy translucent outsole underfoot.',
      'c5'),
  Product(
      'https://stockx-360.imgix.net//Air-Jordan-1-Retro-High-Travis-Scott/Images/Air-Jordan-1-Retro-High-Travis-Scott/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1550180948&w=1000',
      'Travis 1\'s',
      'C\$1,424',
      'The Travis Scott x Air Jordan 1 Retro High features a new look on the iconic silhouette, thanks to an oversized backward-facing Swoosh on the lateral side. A traditionally oriented Swoosh graces the medial side of the upper, which is built with a blend of white leather and brown suede. Additional unique details include a double-layer construction on the collar and Scott’s crudely drawn face logo embossed on the heel.',
      'c6'),
  Product(
      'https://stockx-360.imgix.net//Air-Jordan-6-Retro-Travis-Scott/Images/Air-Jordan-6-Retro-Travis-Scott/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1570475122&w=1000',
      'Travis 6\'s',
      'C\$801',
      'The Travis Scott x Air Jordan 6 Retro Olive represents a collaboration between the Houston based rapper and Jordan Brand. This take on the AJ 6, which Scott debuted while performing during halftime of Super Bowl 53, released in October 2019. It features a Medium Olive, black, Sail and University Red colorway along with several unique elements: a small pocket with a snap on the collar, a nubuck and suede upper, Scott\'s Cactus Jack logo on the heel and a glow in the dark translucent outsole.',
      'c7'),
  Product(
      'https://stockx-360.imgix.net//Nike-Air-Force-1-Low-Off-White-Volt/Images/Nike-Air-Force-1-Low-Off-White-Volt/Lv2/img01.jpg?auto=format,compress&q=90&updated_at=1544566859&w=1000',
      'Air Force 1\'s' ' White Volt',
      'CA\$178',
      'Be more lit than a lightning bolt while wearing Nike and Virgil’s Air Force 1 Low Off-White Volt. This AF1 comes with a volt upper, black Nike “Swoosh”, volt midsole, and volt sole. These sneakers released in December 2018 and retailed for \$170. Demand that sneaker attention and cop these on StockX today.',
      'c8'),
  Product(
      'https://images.solecollector.com/complex/image/upload/c_fill,f_auto,fl_lossy,q_auto,w_1100/grq7vhrgu0kkwsmf836f.jpg',
      'Dunk Low SP\'s',
      'C\$275',
      'The Nike Dunk Low SP ‘Champ Colors’ channels the simple aesthetic of the silhouette’s OG colorways from the ‘80s. The all-leather upper features an orange base with contrasting blue overlays and a white Nike Swoosh. Perforated detailing on the toe box offers added breathability, while a nylon tongue and padded collar combine for a comfortable fit. The low-top rides on a stitched white foam midsole, supported by a blue rubber outsole underfoot.',
      'c9'),
  Product(
      'https://cdn.flightclub.com/TEMPLATE/156750/1.jpg',
      'Top 3\'s',
      'C\$220',
      'The Air Jordan 5 Retro SE ‘Top 3’ combines design elements from a trio of the silhouette’s OG releases. The nubuck upper is drawn from the Black/Metallic Silver colorway, complete with lace locks, quarter panel netting and Nike Air branding on the heel. The embroidered ‘23’ is taken from the Fire Red colorway, with that shoe’s red midsole mashed up with metallic silver shark-tooth detailing. Finally, the purple tongue is lifted from the ‘Grape’ Air Jordan 5, featuring a teal Jumpman front and center.',
      'c10'),
];
