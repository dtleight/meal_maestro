import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Widgets/IngredientForm.dart';
import 'package:meal_maestro/Widgets/NavigationRow.dart';

class RecipeStudioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeStudioPageState();
  }
}

class RecipeStudioPageState extends State<RecipeStudioPage>
{
  late Widget active;
  List<Widget> widgets = [
    IngredientForm(),
    Container(height: 400, width: 400, color: Colors.blue,),
    Container(height: 400, width: 400, color: Colors.green,),
    Container(height: 400, width: 400, color: Colors.orange,)
  ];
  @override
  void initState() {
    active = widgets[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Studio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 1,),
          Center(
            child: NavigationRow(
              items: [
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.red,
                  child: Icon(Icons.assignment_outlined),
                ),
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.blue,
                  child: Icon(Icons.photo),
                ),
                Container(
                  height: 50,
                  width:100,
                  color: Colors.green,
                  child: Icon(Icons.health_and_safety),
                ),
                Container(
                  height: 50,
                  width: 100,
                  color: Colors.orange,
                  child: Icon(Icons.shopping_basket),
                ),
              ],
              activeIndex: 0,
              onTap: (int index) {
                setState(() {
                  active = widgets[index];
                });
              },
            ),
          ),
          Spacer(flex: 1,),
          active,
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
/**
  DefaultTabController(
    length: 3,
    child: TabBar
    (
    onTap: (int index){},
    tabs: [
    Tab(icon: Icon(Icons.book)),
    Tab(icon: Icon(Icons.car_rental)),
    Tab(icon: Icon(Icons.train))
    ]
    ),
    ),
    **/
