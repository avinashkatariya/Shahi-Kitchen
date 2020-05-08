import 'package:flutter/material.dart';
import '../color.dart';

class FoodTypeContainer extends StatelessWidget {
  final String foodType;
  final bool isActive;
  final Function onPressed;
  const FoodTypeContainer({
    Key key,
    this.foodType,
    this.isActive,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
        color: isActive ? primary : Colors.white,
        border: Border.all(
          width: 1,
          color: primary,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)));

    return Container(
      margin: EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8),
      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
      decoration: decoration,
      child: InkWell(
        onTap: (){
          onPressed();
          print("clicked");
        },
        child: Text(foodType),
      ),
    );
  }
}
