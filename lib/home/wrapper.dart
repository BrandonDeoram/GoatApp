import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/authenticate/authenticate.dart';
import 'package:sample/authenticate/sign_in.dart';
import 'package:sample/home/home.dart';
import 'package:sample/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return SignIn();
    } else {
      return Home();
    }
  }
}
