import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HealthOutlookPage extends StatelessWidget
{
  Map<String,double> healthOutlook = {
    'Vegetables': 50,
    'Fruits': 25,
    'Grains': 10,
    'Dairy': 10,
    'Fats': 5,
  };
  List<Color> colorList = [Colors.green, Colors.red, Colors.orange, Colors.blue, Colors.yellow];
  @override
  Widget build(BuildContext context)
  {
   return Container(
     child: PieChart(
       dataMap: healthOutlook,
       colorList: colorList,
       chartValuesOptions: ChartValuesOptions(
         showChartValueBackground: false,
         showChartValues: true,
         showChartValuesInPercentage: true,
         decimalPlaces: 0,
       ),
     ),
   );
  }

}