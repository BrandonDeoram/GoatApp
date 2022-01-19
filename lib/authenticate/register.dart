import 'package:flutter/material.dart';
import 'package:sample/animation/fade_animation.dart';
import 'package:sample/services/auth.dart';
import 'package:sample/shared/const.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  String email = '';
  String password = '';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final AuthService _auth = AuthService();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: FadeAnimation(
                1,
                Container(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Auto_Racing_White_Black.svg/2560px-Auto_Racing_White_Black.svg.png',
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1.5,
                        Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1.7,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextField(
                                  onChanged: (val) {
                                    setState(() {
                                      widget.email = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: TextField(
                                  onChanged: (val) {
                                    setState(() {
                                      widget.password = val;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1.9,
                        InkWell(
                          onTap: () async {
                            if (widget.email.isNotEmpty &&
                                widget.password.isNotEmpty) {
                              dynamic result = await _auth.registerWEP(
                                  widget.email, widget.password);
                              if (result == null) {
                                print('something went wrong signing up');
                              }
                            } else {
                              print('error');
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 60),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: Center(
                              child: Text("Register",
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        2,
                        InkWell(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Center(
                              child: Text(
                            "Already have an account ?",
                            style: TextStyle(color: Colors.white),
                          )),
                        )),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
