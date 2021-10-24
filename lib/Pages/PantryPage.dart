import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Utilities/APIRouter.dart';
import 'package:meal_maestro/Utilities/DatabaseRouter.dart';
import 'package:meal_maestro/Widgets/FoodGrid.dart';
import 'package:meal_maestro/Widgets/Search%20Delegates/ProductSearchDelegate.dart';

import 'PopupPages/IngredientSearchPage.dart';

class PantryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PantryPageState();
  }
}

class PantryPageState extends State<PantryPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
            FutureBuilder(
              //future: APIRouter().searchByProductName("Tomato"),
              future: DatabaseRouter().getPantry(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<FoodItem> items = snapshot.data;
                  return FoodGrid(items);
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.green,
                  ));
                }
              },
            ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Add an Item"),
                      content: Container(
                        height: 500,
                        width: 500,
                        child: IngredientSearchPage(),
                      ),
                    );
                  });
              //APIRouter().searchByProductName("potato");
            },
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
