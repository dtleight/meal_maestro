import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Recipe.dart';
import 'package:meal_maestro/Pages/PopupPages/RecipeSelectionPage.dart';

class MealContainer extends StatefulWidget {
  List<Recipe> recipes;
  MealContainer(this.recipes);

  @override
  State<StatefulWidget> createState() {
    return MealContainerState(recipes);
  }
}

class MealContainerState extends State<MealContainer> {
  List<Recipe> recipes;
  List<Widget> items = [];
  MealContainerState(this.recipes);

  @override
  void initState() {
    recipes.forEach((element) {
      items.add(ListTile(
        title: Text(element.name),
        key: Key((items.length + 1).toString()),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.blueGrey,
              ),
              onPressed: () async {
                Recipe result = await Navigator.push(context, new MaterialPageRoute(builder: (context){return RecipeSelectionPage();}));
                recipes.add(result);
                setState(() {

                  items.add(
                      ListTile(
                        title: Text(result.name),
                        key: Key((items.length + 1).toString()),
                      ),
                  );
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.align_vertical_bottom,
                color: Colors.blueGrey,
              ),
              onPressed: () {
                setState(
                  () {
                    items.add(
                      Divider(
                        key: Key((items.length + 1).toString()),
                        thickness: 5,
                        color: Colors.blueGrey,
                      ),
                    );
                  },
                );
              },
            ),
            Icon(
              Icons.delete,
              color: Colors.blueGrey,
            )
          ]),
          Divider(
            thickness: 5,
            color: Colors.blueGrey,
          ),
          Flexible(
            flex: 9,
            child: ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final Widget item = items.removeAt(oldIndex);
                    items.insert(newIndex, item);
                  });
                },
                key: Key("ListKey"),
                children: items),
          ),
        ],
    );
  }
}
