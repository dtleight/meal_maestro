import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Recipe.dart';
import 'package:meal_maestro/Utilities/DatabaseRouter.dart';

class RecipeSelectionPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {

    return Scaffold
      (
      body: Column(
        children: [
          Spacer(flex:1),
          Flexible( flex: 9,
            child: FutureBuilder(
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
                          onTap: ()
                          {
                            Navigator.pop(context,recipes[index]);
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
        ],
      ),
    );
  }

}