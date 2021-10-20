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
    return Column
      (
      children:
      [
        Text(recipe.name),
        Image.network(recipe.imageSrc),
        Divider(),
        IngredientsList(recipe.ingredients),
      ],
    );
  }

}