import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/RecipeCreator.dart';
import 'package:meal_maestro/Widgets/ExpandableList.dart';

class InstructionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InstructionFormState();
  }
}

class InstructionFormState extends State<InstructionForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        child: Container(
          height: 400,
          width: 400,
          child:
            ExpandableList(
              initial: RecipeCreator().instructionData,
              builder: (int index)
                {
                  //return Padding
                 // (
                 //     padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      //child:
                      return InstructionField(index+1);//,
                  //);
                }
                ),
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
                    //onChanged: (String value){RecipeCreator().instructions?[index] = value;},
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
