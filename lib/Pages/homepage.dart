import 'package:ShahiKitchen/color.dart';
import 'package:ShahiKitchen/models/food.dart';
//import 'package:ShahiKitchen/service/auth.dart';
import 'package:ShahiKitchen/service/database.dart';
import 'package:ShahiKitchen/widgets/food_list.dart';
import 'package:ShahiKitchen/widgets/food_types_listview.dart';
import 'package:ShahiKitchen/widgets/foodgrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseService _databaseService = DatabaseService();
  int currentIndex;
  Stream<List<FoodModel>> stream;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
    stream = _databaseService.foodbyType("Barbeque");
  }

  void changeFoodType(String type, int index) {
    setState(() {
      currentIndex = index;
      stream = null;
    });
    setState(() {
      stream = _databaseService.foodbyType(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return StreamProvider<List<FoodModel>>.value(
      value: stream,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: background,
          leading: Icon(Icons.menu),
          actions: [
            Image.network(
              "https://raw.githubusercontent.com/avinashkatariya/IeduAc-photos/master/1.png",
              width: 40,
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                title: Text("Notification"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket),
                title: Text("Notification"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                title: Text("Notification"),
              ),
            ]),
        body: Container(
          color: background,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, bottom: 8),
                child: Text(
                  "Let's eat \nQuality Food 😋",
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 16, bottom: 8),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      onEditingComplete: () {
                        SystemChrome.restoreSystemUIOverlays();
                      },
                      onChanged: (val) {
                        setState(() {
                          stream = _databaseService.searchFoodByName(val);
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16),
                        hintText: "Search food .....",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: serchBackground,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    width: 40,
                    height: 40,
                    child: RaisedButton(
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        "assets/filter.png",
                        width: 25,
                        height: 25,
                      ),
                      onPressed: () {},
                      color: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 12, right: 16),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                child: FoodTypesListView(
                  onPressed: changeFoodType,
                  activeIndex: currentIndex,
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: FoodList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
