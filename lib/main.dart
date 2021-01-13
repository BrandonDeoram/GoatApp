import 'package:flutter/material.dart';
import 'package:sample/home/home.dart';
import 'package:sample/home/wrapper.dart';
import 'package:sample/model/user.dart';
import 'package:sample/pages/details_page.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/widgets/bottom_items.dart';
import 'notifiers/ProductNotifier.dart';
import 'pages/Page1.dart';
import 'package:provider/provider.dart';

int index;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductNotifier()),
          ],
          child: MaterialApp(
            home: Wrapper(),
            routes: <String, WidgetBuilder>{
              Discover.routeName: (ctx) => Discover(),
              BottomItems.routeName: (ctx) => BottomItems(),
              Details.routeName: (ctx) => Details(index),
            },
          )),
    );
  }
}
