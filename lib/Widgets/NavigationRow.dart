import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationRow extends StatefulWidget {
  List<Widget> items;
  void Function(int)? onTap;
  int? activeIndex;
  MainAxisAlignment? mainAxisAlignment;


  NavigationRow({required this.items, this.activeIndex, this.onTap, this.mainAxisAlignment });

  @override
  State<StatefulWidget> createState() {
    return NavigationRowState(items,activeIndex??0, onTap, mainAxisAlignment??MainAxisAlignment.start);
  }
}
class NavigationRowState extends State<NavigationRow> {
//Add Flexibility
  List<Widget> items;
  int activeIndex;
  void Function(int)? onTap;
  ThemeData activeTheme = ThemeData();
  ThemeData inactiveTheme = ThemeData();
  MainAxisAlignment mainAxisAlignment;

  NavigationRowState(this.items, this.activeIndex, this.onTap, this.mainAxisAlignment)
  {
    //Make sure this is reasonably efficient
    items = items.map((e) => e =
        GestureDetector(onTap: (){updateState(items.indexOf(e));}, child: e,),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row
      (
      mainAxisAlignment: mainAxisAlignment,
      children: items.map((e) => e = Theme(child: e, data: items.indexOf(e)==activeIndex?activeTheme:inactiveTheme),).toList(),
    );
  }

  void updateState(int index)
  {
    setState(() {
        activeIndex = index;
      //items.forEach((e) => setState((){e.setActive(false);}));
      //items[index].setActive(true);
      onTap!.call(index);
    });
  }

  List<Widget> paintRow(List<Widget> items)
  {
   return items.map((e) => e =
        Theme(
            child: GestureDetector(onTap: (){updateState(items.indexOf(e));}, child: e,),
            data: items.indexOf(e)==activeIndex?activeTheme:inactiveTheme)
    ).toList();
  }
}