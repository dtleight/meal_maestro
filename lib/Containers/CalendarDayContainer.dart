import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Pages/PopupPages/HealthOutlookPage.dart';
import 'package:meal_maestro/Widgets/NavigationRow.dart';

class CalendarDayContainer extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return CalendarDayContainerState();
  }
}

class CalendarDayContainerState extends State<CalendarDayContainer>
{
  List<Widget> widgets =
        [
          Container(height: 400, width: 400, color: Colors.red,),
          Container(height: 400, width: 400, color: Colors.blue,),
          HealthOutlookPage(),
          //Container(height: 400, width: 400, color: Colors.green,),
          Container(height: 400, width: 400, color: Colors.orange,),
        ];
  late Widget active;
  @override
  void initState()
  {
    active = widgets[0];
  }

  @override
  Widget build(BuildContext context)
  {
    return Column(
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
    );
  }

}