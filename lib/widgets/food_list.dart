import 'package:ShahiKitchen/models/food.dart';
import 'package:ShahiKitchen/widgets/foodcard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class FoodList extends StatefulWidget {
  FoodList({Key key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    final List<FoodModel> foods = Provider.of<List<FoodModel>>(context);
    return Container(
      child: foods == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : StaggeredGridView.countBuilder(
              itemCount: foods.length,
              shrinkWrap: true,
              crossAxisCount: 2,
              staggeredTileBuilder: (int index) {
                return StaggeredTile.fit(1);
              },
              itemBuilder: (BuildContext context, int index) {
                return FoodCard2(
                  name: foods[index].name,
                  imageUrl: foods[index].fid,
                  type: foods[index].type,
                  price: foods[index].price,
                  calories: foods[index].calories,
                );
              },
            ),
    );
  }
}
