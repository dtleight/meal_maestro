import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context)
  {
   return Container(
     child: PieChart(dataMap: healthOutlook,),
   );
  }

}