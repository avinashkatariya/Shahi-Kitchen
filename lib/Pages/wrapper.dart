import 'package:ShahiKitchen/Pages/authentication.dart';
import 'package:ShahiKitchen/Pages/homepage.dart';
import 'package:ShahiKitchen/models/food.dart';
import 'package:ShahiKitchen/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ShahiKitchen/service/database.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final DatabaseService _databaseService = DatabaseService();
    {
      return user == null
          ? Authentication()
          : StreamProvider<List<FoodType>>.value(
              value: _databaseService.foodTypes, child: Home());
    }
  }
}
