import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';

class FoodGrid extends StatelessWidget
{
  List<FoodItem> items;
  FoodGrid(this.items);

  @override
  Widget build(BuildContext context)
  {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 200,
            width: 200,
            color: Colors.white,
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  child: Image.network(
                    items[index].imageURL,
                    fit: BoxFit.fill,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    items[index].name,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
        });
  }
}