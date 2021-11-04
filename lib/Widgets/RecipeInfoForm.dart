import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Containers/RecipeStudioContainer.dart';
import 'package:meal_maestro/Objects/Cuisine.dart';
import 'package:meal_maestro/Objects/RecipeCreator.dart';
import 'package:meal_maestro/Widgets/CuisineDropdown.dart';

class RecipeInfoForm extends RecipeStudioContainer
{
  @override
  State<StatefulWidget> createState()
  {
    return RecipeInfoFormState();
  }
}

class RecipeInfoFormState extends State<RecipeInfoForm>
{
  TextEditingController textController = new TextEditingController(text: RecipeCreator().name);
  CuisineController cuisineController = new CuisineController(value: RecipeCreator().cuisine?.index??0);
  final InputDecoration inputTheme = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  );

  @override
  Widget build(BuildContext context)
  {
    return Card
      (
      color: Colors.white,
      child: Column(
        children:
        [
          Container(
              height: 100,
              width: 400,
              child: Row(
                children: [
                  Text("Recipe Name", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      controller: textController,
                      decoration: inputTheme,
                      //How to handle state here.
                      //onChanged: (String result){RecipeStudioNotification<String>(result).dispatch(context);},
                      onChanged: (String result){RecipeCreator().name = result;},
                    ),
                  ),
                ],
              ),
          ),
          Container(
            height: 100,
            width: 400,
            child: Row(
              children: [
                Text("Cuisine", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                Spacer(flex: 1,),
                CuisineDropdown(controller: cuisineController, onChanged: (int value){
                  RecipeCreator().cuisine = Cuisine.values[value];
                },),
                Spacer(flex: 1,)
              ],
            ),
          ),
        ],
      ),
    );
  }

}