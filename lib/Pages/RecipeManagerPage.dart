import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Containers/RecipeStudioContainer.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';
import 'package:meal_maestro/Objects/Quantity.dart';
import 'package:meal_maestro/Objects/Recipe.dart';
import 'package:meal_maestro/Utilities/DatabaseRouter.dart';

import 'RecipePage.dart';

class RecipeManagerPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return RecipeManagerPageState();
  }
}

class RecipeManagerPageState extends State<RecipeManagerPage>
{
  @override
  Widget build(BuildContext context)
  {
    return
      Column(
        children: [
          Container(
            height: 450,
            child:
            FutureBuilder(
              future: DatabaseRouter().getPersonalRecipes(),
              builder: (context, AsyncSnapshot<List<Recipe>> data)
              {
                List<Recipe> recipes = data.data??[];
                if(recipes.isNotEmpty) {
                  return ListView.builder(
                    padding: EdgeInsets.all(20),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: Colors.white,
                        leading: Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            "https://image.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600w-1037719192.jpg",
                            fit: BoxFit.fill,),),
                        title: Text(recipes[index].name),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RecipePage(recipes[index]);
                              }));
                        },
                      );
                    },
                  );
                }
                else
                  {
                    return CircularProgressIndicator(color: Colors.green,);
                  }
              }
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){return RecipeStudioContainer();}));
              },
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      );
  }

}