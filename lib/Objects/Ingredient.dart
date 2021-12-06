import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Objects/Quantity.dart';

class Ingredient extends FoodItem
{
  //Remove late at a later date
  late Quantity quantity;
  Ingredient(String name, String edamamID, String imageURL, this.quantity) : super(name,edamamID,imageURL);

  Ingredient scale(int n)
  {
    return Ingredient(name,edamamID,imageURL,quantity.scale(n));
  }

  Ingredient.fromDatabase(Map<String,dynamic> ingredientMap):super("",ingredientMap['edamanID'], "")
  {
    quantity = Quantity(ingredientMap['quantity'],MeasurementUnits.values[ingredientMap['measurementType']]);
  }

}