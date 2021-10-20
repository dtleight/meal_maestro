import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';
import 'package:meal_maestro/Objects/Quantity.dart';

class OwnedIngredient extends Ingredient
{
  DateTime expirationDate;
  OwnedIngredient(String name, String edamamID, String photoURL, Quantity quantity, this.expirationDate) : super(name,edamamID,photoURL, quantity);
}