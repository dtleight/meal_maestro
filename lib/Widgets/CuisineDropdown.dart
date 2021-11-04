import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/Cuisine.dart';

class CuisineDropdown extends StatefulWidget
{
  CuisineController controller;
  void Function(int value)? onChanged;

  CuisineDropdown({required this.controller, this.onChanged });
  @override
  State<StatefulWidget> createState() {
    return CuisineDropdownState(controller:controller, onChanged: onChanged);
  }
}

class CuisineDropdownState extends State<CuisineDropdown>
{
  CuisineController controller;
  void Function(int value)? onChanged;
  CuisineDropdownState({required this.controller, this.onChanged});
  @override
  Widget build(BuildContext context)
  {
    return DropdownButton<int>(
      value: controller.value,
      onChanged: (int? newValue)
      {
        setState((){controller.value = newValue??0;});
        //controller.setValue(newValue??0);
        onChanged!(newValue??0);
      },
      items: List<DropdownMenuItem<int>>.generate(
        Cuisine.values.length,
            (int index)
        {
          //TODO: Remove the janky string call
          return DropdownMenuItem(
            value: index,
            child: Text(Cuisine.values[index].toString().replaceAll("Cuisine.", "")),
          );
        },
      ),
    );
  }
}

class CuisineController {
  int value;
  CuisineController({this.value = 0,});

}
