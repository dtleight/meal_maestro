import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Objects/OwnedIngredient.dart';
import 'package:meal_maestro/Objects/Quantity.dart';
import 'package:meal_maestro/Utilities/DatabaseRouter.dart';
import 'package:meal_maestro/Widgets/MeasurementDropdown.dart';

class AddPantryItemPage extends StatelessWidget
{
  FoodItem foodItem;
  AddPantryItemPage(this.foodItem);

  TextEditingController valueController = new TextEditingController();
  //TextEditingController valueController = new TextEditingController();
  //TextEditingController valueController = new TextEditingController();
  MeasurementController measurementController = new MeasurementController(0);
  final InputDecoration inputTheme = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder( borderRadius: BorderRadius.circular(20.0)),
  );
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Column
        (
        children:
        [
          Spacer(flex: 5),
          TextField(controller: valueController, decoration: inputTheme,),
          Spacer(flex: 1,),
          MeasurementDropdown(controller: measurementController),
          Spacer(flex: 1,),
          TextField(decoration: inputTheme,),
          Spacer(flex: 1,),
          TextButton(
            child: Text("Add to Pantry", style: TextStyle(color: Colors.black),),
            onPressed: ()
            {
              DatabaseRouter().addToPantry(OwnedIngredient(foodItem.name, foodItem.edamamID, foodItem.imageURL, Quantity(double.parse(valueController.value.text), MeasurementUnits.values[measurementController.value]),DateTime.now()));
              Navigator.pop(context);
            },
          ),
          Spacer(flex: 4,)
        ],
      ),
    );
  }

}