import 'package:ShahiKitchen/models/food.dart';
import 'package:ShahiKitchen/widgets/foodcard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FoodGrid extends StatefulWidget {
  FoodGrid({Key key}) : super(key: key);

  @override
  _FoodGridState createState() => _FoodGridState();
}

class _FoodGridState extends State<FoodGrid> {
  @override
  Widget build(BuildContext context) {
    //Size pDimen = MediaQuery.of(context).size;

    final List<FoodModel> foods = Provider.of<List<FoodModel>>(context);
    return foods == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : StaggeredGridView.countBuilder(
            itemCount: foods.length + 1,
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.all(16),
                    child: Text(
                  "Found ${foods.length} results",
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ));
              }

              return FoodCard2(
                name: foods[index - 1].name,
                imageUrl: foods[index - 1].fid,
                type: foods[index - 1].type,
                price: foods[index - 1].price,
                calories: foods[index - 1].calories,
              );
            },
            crossAxisCount: 2,
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(1);
            },
          );
  }
}
