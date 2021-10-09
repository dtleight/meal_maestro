import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Utilities/APIRouter.dart';

class ProductSearchDelegate extends SearchDelegate
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
    return FutureBuilder
      (
      future: APIRouter().searchByProductName("Tomato"),
      builder: (BuildContext context, AsyncSnapshot snapshot)
      {
        List<FoodItem> items = snapshot.data;
        return GridView.builder
          (
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index)
        {
          return Container(
            height: 200,
            width: 200,
            color: Colors.white,
            child: Column(
              children: [
                Image.network(
                  items[index].imageURL,
                  fit: BoxFit.fill,
                ),
                Text(items[index].name),
              ],
            ),
          );
        }
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}