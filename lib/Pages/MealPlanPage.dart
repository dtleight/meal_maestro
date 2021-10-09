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
           onDaySelected: (selectedDay, focusedDay) {
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