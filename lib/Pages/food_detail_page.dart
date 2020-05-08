import 'package:ShahiKitchen/color.dart';
import 'package:ShahiKitchen/models/food.dart';
import 'package:ShahiKitchen/widgets/temp2.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final String herotag, fid;
  const FoodDetailPage({Key key, this.herotag, this.fid}) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    final List<FoodModel> foods = Provider.of<List<FoodModel>>(context);
    if (foods == null)
      return Scaffold(
        body: Center(
          child: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      );

    String imageUrl = foods[0].fid.toString();

    String name = foods[0].name;
    int calories = foods[0].calories;
    String price = foods[0].price.toStringAsFixed(0);
    String time = "20 - 30 mins";
    String rating = "4.2";

    return Container(
      color: background,
      child: Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 2 - 50),
          child: FloatingActionButton(
            backgroundColor: primary,
            child: Icon(
              Icons.add,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ),
        body: Stack(
          children: [
            Hero(
              tag: widget.herotag,
              child: FadeInImage(
                image: NetworkImage(
                  "https://raw.githubusercontent.com/avinashkatariya/IeduAc-photos/master/" +
                      foodImages[imageUrl],
                ),
                placeholder: AssetImage("assets/broken.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 32),
              width: 40,
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width - 56, top: 32),
              width: 40,
              height: 40,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/heart.png",
                  width: 24,
                  height: 24,
                ),
                color: Colors.white30,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.width * 0.64,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.64),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 48, left: 16),
                    child: Row(
                      children: [
                        Text(
                          name,
                          textScaleFactor: 1.5,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 4, right: 2),
                          child: Image.asset(
                            "assets/rupee-indian.png",
                            width: 12,
                            height: 12,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Text(
                            price,
                            textScaleFactor: 1.6,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:16,right:16,top:16),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/star.png",
                          width: 24,
                          height: 24,
                        ),
                        Text(" "+rating,style: TextStyle(fontWeight: FontWeight.w600),),
                        Expanded(child: Container(),),
                        Image.asset(
                          "assets/calories.png",
                          width: 24,
                          height: 24,
                        ),
                        Text(" "+calories.toString()+" Calories",style: TextStyle(fontWeight: FontWeight.w600),),
                        Expanded(child: Container(),),
                        Image.asset(
                          "assets/time.png",
                          width: 24,
                          height: 24,
                        ),
                        Text(" "+time,style: TextStyle(fontWeight: FontWeight.w600),),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 140,
              height: 50,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.64 - 25,
                left: MediaQuery.of(context).size.width / 2 - 70,
              ),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
