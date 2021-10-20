import 'package:flutter/cupertino.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';
import 'package:meal_maestro/Objects/Quantity.dart';
import 'package:meal_maestro/Widgets/IngredientsList.dart';

class DailyIngredientList extends StatelessWidget
{
  List<Ingredient> ingredients =
      [
        Ingredient("Tomato","id","", Quantity(3.5,MeasurementUnits.cups)),
        Ingredient("Potato","id","", Quantity(3.5,MeasurementUnits.cups)),
        Ingredient("Brussel Sprouts","id","", Quantity(3.5,MeasurementUnits.cups)),
        Ingredient("Asparagus","id","", Quantity(3.5,MeasurementUnits.cups)),
      ];
  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 400,
      width: 400,
      child: IngredientsList(ingredients),
    );
  }

}