import 'package:ShahiKitchen/models/food.dart';
import 'package:ShahiKitchen/widgets/food_type_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FoodTypesListView extends StatelessWidget {
  final int activeIndex;
  final Function onPressed;
  const FoodTypesListView({Key key, this.activeIndex, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FoodType> foodstypes = Provider.of<List<FoodType>>(context);
    return foodstypes == null ? Container() :ListView.builder(
      itemBuilder: (context, index) {
        return FoodTypeContainer(
          isActive: index == activeIndex,
          foodType: foodstypes[index].type,
          onPressed: (){
            onPressed(foodstypes[index].type,index);
          },
        );
      },
      itemCount: foodstypes.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
