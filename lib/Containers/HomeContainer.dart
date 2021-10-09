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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today,), label: "Recipe Manager"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_rounded), label: "Shoping List"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Pantry"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "Share")
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedFontSize: 18,
        currentIndex: index,
        onTap: (int index)
        {
            setState((){this.index = index;});
        },
      ),
    );
  }

}