import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
           firstDay: DateTime.utc(2021,10,1),
           lastDay: DateTime.utc(2021,10,31),
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
                   content: Container(height: 500, width: 500,),
                 );
               },
             );
             setState(() {
               this.selectedDay = selectedDay;
             });
           },

         ),
       )
      ],
    );
  }

}