import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Recipe.dart';
import 'package:meal_maestro/Widgets/IngredientsList.dart';

class RecipePage extends StatelessWidget
{
  Recipe recipe;
  RecipePage(this.recipe);
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.edit))],
      ),
      body: Column
        (
        children:
        [
          Expanded(flex:2, child: Image.network(recipe.imageSrc)),
          Expanded(
            flex: 6,
            child: Card(
              color: Colors.white,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TabBar(
                        labelColor: Colors.black,
                          tabs: [
                            Tab(text: "Recipe",),
                            Tab(text: "Ingredients"),
                          ],
                        ),
                    ),
                    Container(
                      height: 385 ,
                      child: TabBarView(
                        children:
                        [
                          Container(
                            height: 400,
                            width: 400,
                            color: Colors.red,
                          ),
                          IngredientsList(recipe.ingredients),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ),
          ),
        ],
    ),
    );
  }

}