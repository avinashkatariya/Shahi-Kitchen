import 'package:ShahiKitchen/Pages/register.dart';
import 'package:ShahiKitchen/Pages/signin.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget 
{
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> 
{
  bool showSignin = true ;

  void toggleView()
{
    setState(() 
{
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) 
{
    return showSignin?SignIn(toggelFunction: toggleView,):Register(toggelFunction: toggleView,);
  }
}