import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/pages/details_page.dart';

class Top5 extends StatelessWidget {
  Top5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double name_width = MediaQuery.of(context).size.width * .45;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
          child: Text(
            'Top 5 Popular',
            style: Theme.of(context).primaryTextTheme.headline5,
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 80),
            child: ListView.builder(
              itemCount: top5shoes.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Details(top5shoes, index)));
                      },
                      trailing: Container(
                          width: name_width,
                          child: Text(
                            top5shoes[index].name,
                            textAlign: TextAlign.left,
                          )),
                      leading: Text('${index + 1}'),
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          height: 50,
                          child: Image.network(top5shoes[index].assetName),
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
