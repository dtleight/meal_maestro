import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';

class IngredientsList extends StatelessWidget
{
  List<Ingredient> ingredients;

  IngredientsList(this.ingredients);

  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index)
        {
          Ingredient i = ingredients[index];
          return ListTile(
            title: Text(i.quantity.toString() + " " + i.name),);
        }
        );
  }
}