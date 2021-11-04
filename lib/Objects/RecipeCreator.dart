import 'package:meal_maestro/Objects/Ingredient.dart';

import 'Cuisine.dart';

class RecipeCreator
{
  String? name;
  Cuisine? cuisine;
  List<Ingredient>? ingredients;
  List<String>? instructions;


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

  }

  void reset()
  {
    name = null;
    cuisine = null;
    ingredients = null;
    instructions = null;
  }


}