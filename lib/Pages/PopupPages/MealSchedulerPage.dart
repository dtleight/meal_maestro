import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Recipe.dart';
import 'package:meal_maestro/Utilities/DatabaseRouter.dart';
import 'package:meal_maestro/Widgets/ExpandableList.dart';
import 'package:meal_maestro/Widgets/MealContainer.dart';

class MealSchedulerPage extends StatefulWidget
{
  DateTime date;
  MealSchedulerPage(this.date);

  @override
  State<StatefulWidget> createState()
  {
    return MealSchedulerPageState(date);
  }
}
class MealSchedulerPageState extends State<MealSchedulerPage>
{
  DateTime date;
  MealSchedulerPageState(this.date);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 400, width: 400,
      child:
      Column(
        children: [
          Flexible(
            flex: 9,
            child:

            FutureBuilder(
              future: DatabaseRouter().getPersonalRecipes(),
              builder: (BuildContext context,AsyncSnapshot<List<Recipe>>snapshot) {
                if(snapshot.hasData) {
                  return MealContainer(snapshot.data??[]);
                }
                return CircularProgressIndicator();
                  }
            )
          ),
        ],
      ),
    );
  }
}