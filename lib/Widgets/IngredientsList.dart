import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';

class IngredientsList extends StatefulWidget
{
  List<Ingredient> ingredients;

  IngredientsList(this.ingredients);
  @override
  State<StatefulWidget> createState() {
    return IngredientsListState(ingredients);
  }

}
class IngredientsListState extends State<IngredientsList>
{
  List<Ingredient> ingredients;
  late List<bool> activeCheckbox;


  IngredientsListState(this.ingredients);

  @override initState()
  {
     activeCheckbox = List<bool>.generate(ingredients.length, (index) => false);
  }
  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index)
        {

          Ingredient i = ingredients[index];
          return CheckboxListTile(
              value: activeCheckbox[index],
              onChanged: (bool? inVal){setState((){activeCheckbox[index] = inVal!;});},
              title: Text(i.quantity.toString() + " " + i.name),
          );
        }
        );
  }
}