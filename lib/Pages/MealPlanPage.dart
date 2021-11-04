import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Containers/CalendarDayContainer.dart';
import 'package:table_calendar/table_calendar.dart';

class MealPlanPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return MealPlanPageState();
  }
}

class MealPlanPageState extends State<MealPlanPage>
{
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children:
      [
       Card(
         color: Colors.white,
         child: TableCalendar(
           firstDay: DateTime.utc(2021,11,1),
           lastDay: DateTime.utc(2021,11,31),
           focusedDay: DateTime.now(),
           selectedDayPredicate: (day)
           {
             return selectedDay.compareTo(day) == 0;
           },
           onDaySelected: (selectedDay, focusedDay)
           {
             //Display the meal selector
             showDialog
               (
               context: context,
               builder: (BuildContext context)
             {
                 return AlertDialog
                   (
                   title: Text("Meal Schedule"),
                   content: Container(
                     height: 500, width: 500,
                     child: CalendarDayContainer(),
                   ),
                 );
               },
             );
             setState(() {
               this.selectedDay = selectedDay;
             });
           },

         ),
       ),
        Spacer(flex: 1,),
        Flexible(
          flex: 5,
          child: Card(color: Colors.white,
            child: Container(
              height: 100, width: 500,
              child: Center
                (
                child: Column(
                  children: [
                    Text("Todays Meals"),
                    Divider(),
                    Text("BLTs"),
                    Text("Carnitas Tacos"),
                    Text("Ice Cream Floats"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}