import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealSchedulerPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return MealSchedulerPageState();
  }
}
class MealSchedulerPageState extends State<MealSchedulerPage>
{
  List<Widget> items =
  [
    ListTile(title: Text("BLTS"), key: Key("1"),),
    ListTile(title: Text("Carnitas Tacos"), key: Key("2"),),
    ListTile(title: Text("Ice Cream Floats"), key: Key("3"),),
  ];

  @override
  void initState() {
    //items.map((e) => Container(child:e,key: Key(items.indexOf(e).toString()) ,));
  }
  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 400, width: 400,
      child:
      Column(
        children: [
          Flexible(flex: 1, child: Container(color: Colors.blue,),),
          Flexible(
            flex: 9,
            child: ReorderableListView
              (
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final Widget item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
              },
              children: items,
            ),
          ),
        ],
      ),
    );
  }
}