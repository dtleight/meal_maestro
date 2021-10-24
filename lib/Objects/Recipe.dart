import 'package:meal_maestro/Objects/Ingredient.dart';

class Recipe
{
  String name;
  String imageSrc;
  int servingSize;
  List<Ingredient> ingredients = [];
  List<String> steps;

  Recipe(this.name, this.imageSrc,  this.servingSize, this.ingredients, this.steps);

  Recipe scale(int n)
  {
   return Recipe(name, imageSrc, servingSize*n, ingredients.map((e) => e.scale(n)).toList(), steps);
  }
}