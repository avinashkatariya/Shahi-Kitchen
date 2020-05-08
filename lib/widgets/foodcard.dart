import 'package:ShahiKitchen/widgets/temp2.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name, type, imageUrl;
  final int calories;
  final double price;

  const FoodCard(
      {Key key, this.name, this.type, this.imageUrl, this.calories, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFc0c0c0),
              Color(0xFFf0f0f0),
              Color(0xFFffffff),
              Color(0xFFffffff),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              child: FadeInImage(
                image: NetworkImage(
                  "https://raw.githubusercontent.com/avinashkatariya/IeduAc-photos/master/" +
                      foodImages[imageUrl],
                ),
                placeholder: AssetImage("assets/broken.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                name,
                textScaleFactor: 1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(type, textScaleFactor: .7),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                "🔥" + calories.toString() + " Calories",
                textScaleFactor: .8,
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4, right: 2),
                    child: Image.asset(
                      "assets/rupee-indian.png",
                      width: 12,
                      height: 12,
                    ),
                  ),
                  Text(
                    price.toString(),
                    textScaleFactor: 1.6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
