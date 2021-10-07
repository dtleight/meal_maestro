import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Pages/MealPlanPage.dart';
import 'package:meal_maestro/Pages/PantryPage.dart';
import 'package:meal_maestro/Pages/RecipeManagerPage.dart';
import 'package:meal_maestro/Pages/SettingsPage.dart';
import 'package:meal_maestro/Pages/ShoppingListPage.dart';

class HomeContainer extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() 
  {
    return HomeContainerState();
  }
}

class HomeContainerState extends State<HomeContainer>
{
  List<Widget> active = [RecipeManagerPage(), ShoppingListPage(), MealPlanPage(), PantryPage(), SettingsPage()];
  int index = 0;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(title: Text("Meal Maestro"),),
      body: active[index],
      bottomNavigationBar: BottomNavigationBar
        (
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), tooltip: "Recipe Manager"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded), tooltip: "Shoping List"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), tooltip: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), tooltip: "Pantry"),
          BottomNavigationBarItem(icon: Icon(Icons.share), tooltip: "Share")
        ],
        onTap: (int index)
        {
            setState((){this.index = index;});
        },
      ),
    );
  }
  
}