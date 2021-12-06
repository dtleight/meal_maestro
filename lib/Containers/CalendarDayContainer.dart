import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Pages/PopupPages/DailyIngredientList.dart';
import 'package:meal_maestro/Pages/PopupPages/HealthOutlookPage.dart';
import 'package:meal_maestro/Pages/PopupPages/MealSchedulerPage.dart';
import 'package:meal_maestro/Widgets/NavigationRow.dart';

class CalendarDayContainer extends StatefulWidget
{
  DateTime date;
  CalendarDayContainer(this.date);
  @override
  State<StatefulWidget> createState()
  {
    return CalendarDayContainerState(date);
  }
}

class CalendarDayContainerState extends State<CalendarDayContainer>
{
  DateTime date;
  CalendarDayContainerState(this.date);

  List<Widget> widgets = [];
  late Widget active;

  @override
  void initState()
  {
    widgets =
    [
      //Container(height: 400, width: 400, color: Colors.red,),
      MealSchedulerPage(date),
      Container(height: 400, width: 400, color: Colors.blue,),
      HealthOutlookPage(),
      //Container(height: 400, width: 400, color: Colors.green,),
      DailyIngredientList(),
      //Container(height: 400, width: 400, color: Colors.orange,),
    ];
    active = widgets[0];
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Column(
        children:
      [
        NavigationRow(
          items:
          [
            Container(height: 50, width: 70, color: Colors.red, child: Icon(Icons.assignment_outlined),),
            Container(height: 50, width: 70, color: Colors.blue, child: Icon(Icons.calendar_today),),
            Container(height: 50, width: 70, color: Colors.green, child: Icon(Icons.health_and_safety),),
            Container(height: 50, width: 70, color: Colors.orange, child: Icon(Icons.shopping_basket),),
          ],
          activeIndex: 0,
          onTap: (int index){setState((){active = widgets[index];});},
        ),
        Spacer(flex: 1,),
        active,
        Spacer(flex: 1,),

      ],
      ),
    );
  }

}