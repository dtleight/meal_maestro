import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Containers/RecipeStudioContainer.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';
import 'package:meal_maestro/Objects/Quantity.dart';
import 'package:meal_maestro/Objects/Recipe.dart';

import 'RecipePage.dart';

class RecipeManagerPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return RecipeManagerPageState();
  }
}

class RecipeManagerPageState extends State<RecipeManagerPage>
{
  List<Ingredient> ingredients =
  [
    Ingredient("Tomato","id","", Quantity(3.5,MeasurementUnits.cups)),
    Ingredient("Potato","id","", Quantity(3.5,MeasurementUnits.cups)),
    Ingredient("Brussel Sprouts","id","", Quantity(3.5,MeasurementUnits.cups)),
    Ingredient("Asparagus","id","", Quantity(3.5,MeasurementUnits.cups)),
  ];
  late Recipe recipe;

  @override void initState() {
    recipe = Recipe("Tomato Soup", "", 3, ingredients, []);
  }
  @override
  Widget build(BuildContext context)
  {
    return

      Column(
        children: [
          Container(
            height: 450,
            child: ListView
            (
            padding: EdgeInsets.all(20),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children:
            List.generate(15,
            (index)
              {
              return ListTile(
              tileColor: Colors.white,
              leading: Container(
              width: 100,
              height: 100,
              child: Image.network("https://image.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600w-1037719192.jpg", fit: BoxFit.fill,),),
              title: Text("Recipe Name"),
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return RecipePage(recipe);}));},
              );
              })
    ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){return RecipeStudioContainer();}));
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