import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:meal_maestro/Objects/Quantity.dart";

class MeasurementDropdown extends StatefulWidget
{
  MeasurementController controller;
  void Function(int value)? onChanged;
  MeasurementDropdown({required this.controller, this.onChanged});
  @override
  State<StatefulWidget> createState() {
    return MeasurementDropdownState(controller:controller, onChanged: onChanged);
  }
}
class MeasurementDropdownState extends State<MeasurementDropdown>
{
  MeasurementController controller;
  void Function(int value)? onChanged;
  MeasurementDropdownState({required this.controller, this.onChanged});
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
            MeasurementUnits.values.length,
                (int index)
            {
              //TODO: Remove the janky quantity call
              return DropdownMenuItem(
                value: index,
                child: Text(MeasurementUnits.values[index].toString().replaceAll("MeasurementUnits.", "")),
              );
            },
            ),
    );
  }
}

class MeasurementController
{
  int value = 0;
  MeasurementController(this.value);
}