import 'package:ShahiKitchen/Pages/wrapper.dart';
import 'package:ShahiKitchen/color.dart';
import 'package:ShahiKitchen/models/user.dart';
import 'package:ShahiKitchen/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primary,
        ),
        home: Wrapper(),
      ),
    );
  }
}
