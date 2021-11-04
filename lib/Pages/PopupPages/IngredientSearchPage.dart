import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Pages/AddPantryItemPage.dart';
import 'package:meal_maestro/Utilities/APIRouter.dart';
import 'package:meal_maestro/Widgets/FoodGrid.dart';

class IngredientSearchPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
   return IngredientSearchPageState();
  }
}

class IngredientSearchPageState extends State<IngredientSearchPage>
{
  TextEditingController searchField = new TextEditingController();
  List<FoodItem> items = [];
  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 400, width: 400,
      child: Column
        (
        children:
        [
          Row(
          children: [
            Flexible(flex: 9, child: TextField(controller: searchField)),
            Flexible(flex: 1, child: IconButton(
              onPressed: (){searchFor(searchField.value.text);},
              icon: Icon(Icons.done_outline),
            ),
            ),
            ],
          ),
          Expanded(
            flex: 1,
            child: FoodGrid(
              items,
              onClick: (int index)
              {
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){return AddPantryItemPage(items[index]);
                },
                ),
                );
            },
            ),
          ),

        ],
      ),
    );
  }

  void searchFor(String searchTerm) async
  {
    List<FoodItem> results = await APIRouter().searchByProductName(searchTerm);
    setState((){items = results;});
  }
}