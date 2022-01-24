import 'package:flutter/material.dart';
import 'package:sample/home/wrapper.dart';
import 'package:sample/model/products.dart';
import 'package:sample/model/user.dart';
import 'package:sample/pages/details_page.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/widgets/bottom_items.dart';
import 'notifiers/ProductNotifier.dart';
import 'pages/Page1.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

int index;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> list = [];
    return StreamProvider<UserUID>.value(
      value: AuthService().user,
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductNotifier()),
          ],
          child: MaterialApp(
            theme: ThemeData(
                fontFamily: 'Roboto',
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.black,
                    centerTitle: true,
                    titleTextStyle:
                        TextStyle(color: Colors.white, fontFamily: 'Robot')),
                primaryTextTheme: TextTheme(
                  //Drops
                  headline5: TextStyle(
                      color: Colors.black, fontFamily: 'Roboto', fontSize: 10),
                  caption: TextStyle(color: Colors.white, fontSize: 14),
                ),
                scaffoldBackgroundColor: Colors.white),
            home: Wrapper(),
            routes: <String, WidgetBuilder>{
              Discover.routeName: (ctx) => Discover(),
              BottomItems.routeName: (ctx) => BottomItems(),
              Details.routeName: (ctx) => Details(list, index),
            },
          )),
    );
  }
}
