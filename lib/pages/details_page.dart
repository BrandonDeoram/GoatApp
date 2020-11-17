import 'package:flutter/material.dart';
import 'package:sample/model/products.dart';
import 'package:sample/widgets/cart.dart';

class Details extends StatefulWidget {
  int newIndex;
  List<Product> _list = new List<Product>();
  Details(this.newIndex, this._list);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void _addList() {
    setState(() {
      var item = products[widget.newIndex];
      widget._list.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart(widget._list)));
              },
              icon: (widget._list.isEmpty)
                  ? Icon(Icons.shopping_cart_outlined)
                  : Icon(Icons.shopping_cart)),
        ],
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    color: Colors.black,
                    indent: 50,
                    endIndent: 40,
                  ),
                  Container(
                    child: Text(products[widget.newIndex].name),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 50,
                    endIndent: 40,
                  ),
                  Container(
                      height: 190,
                      color: Colors.white,
                      child:
                          Image.network(products[widget.newIndex].assetName)),
                  Container(
                    child: Text('Product Detail'),
                    alignment: Alignment.topLeft,
                  ),
                  Container(
                    child: Divider(
                      endIndent: 240,
                    ),
                  ),
                  Container(
                    height: 110,
                    child: Text(
                      products[widget.newIndex].descript,
                      style: TextStyle(fontSize: 10),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 58),
                    alignment: Alignment.center,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24))),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: IconButton(
                                  onPressed: () {
                                    print('tapped');
                                  },
                                  icon: Icon(Icons.favorite),
                                  color: Colors.white,
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(
                                  padding: EdgeInsets.only(left: 100),
                                  child: Text(
                                    products[widget.newIndex].price,
                                    style: TextStyle(
                                        color: Colors.white, letterSpacing: 2),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 70),
                                child: IconButton(
                                  onPressed: _addList,
                                  icon: Icon(Icons.add_shopping_cart),
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
