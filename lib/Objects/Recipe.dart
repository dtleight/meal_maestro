import 'package:meal_maestro/Objects/Ingredient.dart';

class Recipe
{
  String? id;
  String name;
  String imageSrc;
  double servingSize;
  List<Ingredient> ingredients = [];
  List<String> steps;

  Recipe(this.name, this.imageSrc,  this.servingSize, this.ingredients, this.steps, {this.id});


  Recipe scale(int n)
  {
   return Recipe(name, imageSrc, servingSize*n, ingredients.map((e) => e.scale(n)).toList(), steps, id:id);
  }

  String toString()
  {
    return "Recipe Name: $name\nImage: $imageSrc\nServing Size: $servingSize\nIngredients: ${ingredients.toString()}";
  }
}