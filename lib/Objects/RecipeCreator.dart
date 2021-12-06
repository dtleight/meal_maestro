import 'package:meal_maestro/Objects/Quantity.dart';
import 'package:meal_maestro/Widgets/IngredientForm.dart';
import 'package:meal_maestro/Widgets/InstructionForm.dart';
import 'package:meal_maestro/Widgets/MeasurementDropdown.dart';

import 'Cuisine.dart';

class RecipeCreator
{
  String? name;
  double? servingSize;
  Cuisine? cuisine;
  List<IngredientField> ingredientData = [];
  List<InstructionField> instructionData= [];
  List<MeasurementUnits> measurementUnits = [];


  static final RecipeCreator _rc = RecipeCreator._internal();

  factory RecipeCreator()
  {
    return _rc;
  }

  RecipeCreator._internal();
  ///
  ///Initializes the DatabaseRouting singleton
  ///
  void init() async
  {
    reset();
  }

  void reset()
  {
    name = "";
    cuisine = null;
    servingSize = 1.0;
    ingredientData = [];
    instructionData = [];
  }


}