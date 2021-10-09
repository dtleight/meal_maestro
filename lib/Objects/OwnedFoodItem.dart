import 'package:meal_maestro/Objects/FoodItem.dart';

import 'Quantity.dart';

class OwnedFoodItem extends FoodItem
{
  Quantity quantity;
  DateTime expirationDate;

  OwnedFoodItem(String name, String edamamID, String photoURL, this.quantity, this.expirationDate) : super(name,edamamID,photoURL);
}