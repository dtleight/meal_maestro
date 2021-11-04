import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_maestro/Widgets/MeasurementDropdown.dart';

class IngredientForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IngredientFormState();
  }
}

class IngredientFormState extends State<IngredientForm> {
  List<Widget> textItems = [
    Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: IngredientField(),
    ),
  ];
  late Widget addButton;
  late Widget removeButton;

  @override
  void initState() {
    addButton = IconButton(
        onPressed: () {
          setState(() {
            textItems.add(
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: IngredientField(),
              ),
            );
          });
        },
        icon: Icon(Icons.add));
    removeButton = IconButton(
        onPressed: () {
          setState(() {
            textItems.removeLast();
          });
        },
        icon: Icon(Icons.remove));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
              children: [
            ...textItems,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [addButton, textItems.length > 1?removeButton:Container()],
            )
          ]),
        ),
      ),
    );
  }
}

class IngredientField extends StatelessWidget {
  final InputDecoration inputTheme = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  );

  TextEditingController nameController = new TextEditingController();
  TextEditingController valueController = new TextEditingController();
  MeasurementController measurementController = new MeasurementController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 40,
            width: 300,
            child: TextField(
              controller: nameController,
              decoration: inputTheme,
            )),
        Row(
          children: [
            Spacer(flex: 1,),
            Container(
                height: 40,
                width: 100,
                child: TextField(
                  controller: valueController,
                  decoration: inputTheme,
                )),
            Spacer(flex: 1,),
            MeasurementDropdown(controller: measurementController,),
            Spacer(flex: 1,),
          ],
        ),
      ],
    );
  }
}
