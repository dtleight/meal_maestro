import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:meal_maestro/Objects/Quantity.dart";

class MeasurementDropdown extends StatefulWidget
{
  MeasurementController? controller;
  MeasurementDropdown({this.controller});
  @override
  State<StatefulWidget> createState() {
    return MeasurementDropdownState(controller:controller);
  }
}
class MeasurementDropdownState extends State<MeasurementDropdown>
{
  MeasurementController? controller;
  MeasurementDropdownState({this.controller});
  int ddVal = 0;
  @override
  Widget build(BuildContext context)
  {
    return DropdownButton<int>(
      value: ddVal,
      onChanged: (int? newValue)
      {
        setState((){ddVal = newValue??0;});
        controller?.setValue(newValue??0);
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
  MeasurementController();

  void setValue(int value)
  {
    this.value = value;
  }
}