import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Utilities/APIRouter.dart';

import '../FoodGrid.dart';

class ProductSearchDelegate extends SearchDelegate<FoodItem>
{
  @override
  List<Widget>? buildActions(BuildContext context)
  {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context)
  {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){},);
  }

  @override
  Widget buildResults(BuildContext context)
  {
    return FutureBuilder(
      future: APIRouter().searchByProductName(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<FoodItem> items = snapshot.data;
          return FoodGrid(items, onClick: (int index){
            close(context, items[index]);
          },);
        } else {
          return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /**
    return FutureBuilder(
      future: APIRouter().searchByProductName(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<FoodItem> items = snapshot.data;
          return FoodGrid(items, onClick: (int index){
            close(context, items[index]);
          },);
        } else {
          return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
          );
        }
      },
    );
        **/
    return Container();
  }

}