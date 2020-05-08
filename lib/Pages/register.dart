import 'package:ShahiKitchen/color.dart';
import 'package:ShahiKitchen/service/auth.dart';
import 'package:ShahiKitchen/widgets/tabAuthButons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  final Function toggelFunction;
  Register({Key key, this.toggelFunction}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();

  final _formkey = GlobalKey<FormState>();

  String email = "", password = "", error = "";

  @override
  Widget build(BuildContext context) {
    Size pDimen = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: background,
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xa0a0a0),
                      blurRadius: 32,
                      spreadRadius: 4,
                      offset: Offset(0, 15))
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Image.asset(
                    "assets/chef.png",
                    width: pDimen.width,
                    height: pDimen.width * 0.837,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 8, bottom: 16),
                    child: Center(
                        child: Text(
                      "Shahi Kitchen  ",
                      textScaleFactor: 1.4,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 32,
                          right: 16,
                        ),
                        child: TabAuthButton(
                          btext: "Login",
                          onPressed: () {
                            widget.toggelFunction();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 32,
                          left: 16,
                        ),
                        child: TabAuthButton(
                          btext: "Signup",
                          isActive: true,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: pDimen.height * 0.01,
                      left: pDimen.width * 0.08,
                      right: pDimen.width * 0.08),
                  child: TextFormField(
                    validator: (val) =>
                        val.isEmpty ? "Enter an  valid email" : null,
                    onChanged: (v) {
                      setState(() {
                        email = v;
                      });
                    },
                    cursorColor: primary,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: pDimen.height * 0.01,
                      left: pDimen.width * 0.08,
                      right: pDimen.width * 0.08),
                  child: TextFormField(
                    onChanged: (v) {
                      setState(() {
                        password = v;
                      });
                    },
                    cursorColor: primary,
                    obscureText: true,
                    validator: (val) => val.length < 8
                        ? "Length of password must be greater than 8"
                        : null,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: pDimen.height * 0.03,
                  ),
                  width: pDimen.width * 0.8,
                  child: RaisedButton(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    textColor: Colors.black87,
                    child: Text(
                      "Signup",
                    ),
                    color: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () async {
                      print(email);
                      print(password);
                      dynamic result = await _authService
                          .registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = "Something went wrong !!!!";
                        });
                      } else {
                        print("signed in");
                        print(result.uid);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
