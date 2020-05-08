import 'package:ShahiKitchen/Pages/food_detail_page.dart';
import 'package:ShahiKitchen/service/database.dart';
import 'package:ShahiKitchen/widgets/temp2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodCard2 extends StatelessWidget {
  final String name, type, imageUrl;
  final int calories;
  final double price;

  FoodCard2(
      {Key key, this.name, this.type, this.imageUrl, this.calories, this.price})
      : super(key: key);

  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    Size pDimen = MediaQuery.of(context).size;
    return Container(
      width: pDimen.width * 0.6,
      margin: EdgeInsets.only(
        top: 4,
        bottom: 0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                print(imageUrl);
                return StreamProvider.value(
                  value: _databaseService.foodById(int.parse(imageUrl)),
                  child: FoodDetailPage(
                    herotag: name,
                    fid: imageUrl,
                  ),
                );
              },
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
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
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: name,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: FadeInImage(
                      image: NetworkImage(
                        "https://raw.githubusercontent.com/avinashkatariya/IeduAc-photos/master/" +
                            foodImages[imageUrl],
                      ),
                      placeholder: AssetImage("assets/broken.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    name,
                    textScaleFactor: 1,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    type,
                    textScaleFactor: .7,
                    style: TextStyle(color: Colors.black54),
                  ),
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
                        price.toStringAsFixed(0),
                        textScaleFactor: 1.6,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
