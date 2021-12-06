import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';
import 'package:meal_maestro/Objects/Quantity.dart';
import 'package:meal_maestro/Objects/RecipeCreator.dart';
import 'package:meal_maestro/Widgets/ExpandableList.dart';
import 'package:meal_maestro/Widgets/MeasurementDropdown.dart';
import 'package:meal_maestro/Widgets/Search%20Delegates/ProductSearchDelegate.dart';

class IngredientForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IngredientFormState();
  }
}

class IngredientFormState extends State<IngredientForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
          child: ExpandableList(
            initial: RecipeCreator().ingredientData,
            builder: (int index) {
                return IngredientField();

            },
          ),
        ),
      ),
    );
  }
}

class IngredientField extends StatelessWidget {

  TextEditingController nameController = new TextEditingController();
  TextEditingController valueController = new TextEditingController();
  MeasurementController measurementController = new MeasurementController(0);
  FoodItem? foodItem = null;
  IngredientField();
  IngredientField.fromIngredient(Ingredient ingredient)
  {
    measurementController = new MeasurementController(ingredient.quantity.type.index);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 40,
            width: 300,
            child: TextField(
              onTap: ()async
              {
                foodItem = await showSearch<FoodItem>(context: context, delegate: ProductSearchDelegate());
                nameController.text = foodItem?.name??"";
                },
              controller: nameController,
              //decoration: inputTheme,
            )),
        Row(
          children: [
            Spacer(
              flex: 1,
            ),
            Container(
                height: 40,
                width: 100,
                child: TextField(
                  controller: valueController,
                  //decoration: inputTheme,
                )),
            Spacer(
              flex: 1,
            ),
            MeasurementDropdown(
              controller: measurementController,
              onChanged: (int value){
                RecipeCreator().measurementUnits.add(MeasurementUnits.values[value]);
                },
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }
}
