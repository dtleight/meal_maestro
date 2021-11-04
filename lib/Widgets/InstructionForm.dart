import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MeasurementDropdown.dart';

class InstructionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InstructionFormState();
  }
}

class InstructionFormState extends State<InstructionForm> {
  List<Widget> textItems = [
    Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: InstructionField(1),
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
                child: InstructionField(textItems.length+1),
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
        child: Container(
          height: 400,
          width: 400,
          child: ListView(scrollDirection: Axis.vertical, children: [
            ...textItems,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                addButton,
                textItems.length > 1 ? removeButton : Container()
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class InstructionField extends StatelessWidget
{
  int index;
  InstructionField(this.index);
  final InputDecoration inputTheme = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
  );

  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 100,
            width: 400,
            child: Row(
              children: [
                Text(index.toString(), style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                Expanded(
                  child: TextField(
                    maxLines: 3,
                    controller: textController,
                    decoration: inputTheme,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
