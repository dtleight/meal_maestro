import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Cuisine.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';
import 'package:meal_maestro/Objects/RecipeCreator.dart';
import 'package:meal_maestro/Widgets/IngredientForm.dart';
import 'package:meal_maestro/Widgets/InstructionForm.dart';
import 'package:meal_maestro/Widgets/NavigationRow.dart';
import 'package:meal_maestro/Widgets/RecipeInfoForm.dart';

class RecipeStudioContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeStudioContainerState();
  }
}

class RecipeStudioContainerState extends State<RecipeStudioContainer>
{
  String? recipeName;
  Cuisine? cuisineType;
  List<Ingredient>? ingredients;
  List<String>? insturctions;



  late Widget active;
  List<Widget> widgets = [
    RecipeInfoForm(),
    IngredientForm(),
    InstructionForm(),
    Container(height: 400, width: 400, color: Colors.orange,)
  ];
  @override
  void initState() {
    active = widgets[0];
    super.initState();
    RecipeCreator().init();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Studio"),
        actions: [
          IconButton(icon: Icon(Icons.check), onPressed: (){print(RecipeCreator().name);},),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1,),
          Center(
            child: NavigationRow(
              items: [
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.red,
                  child: Icon(Icons.assignment_outlined),
                ),
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.blue,
                  child: Icon(Icons.photo),
                ),
                Container(
                  height: 50,
                  width:100,
                  color: Colors.green,
                  child: Icon(Icons.health_and_safety),
                ),
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.orange,
                  child: Icon(Icons.shopping_basket),
                ),
              ],
              activeIndex: 0,
              onTap: (int index) {
                setState(() {
                  active = widgets[index];
                });
              },
            ),
          ),
          Spacer(flex: 1,),
          Expanded(
              flex: 10,
              child: active,
              ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
