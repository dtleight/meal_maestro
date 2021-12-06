import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  List<Widget> initial;
  Widget Function(int index) builder;

  ExpandableList({required this.initial, required this.builder});

  @override
  State<StatefulWidget> createState() {
    return ExpandableListState(builder: builder, items: initial);
  }
}

class ExpandableListState extends State<ExpandableList> {
  List<Widget> items = [];
  Widget Function(int index) builder;
  late Widget addButton;
  late Widget removeButton;

  ExpandableListState({required this.builder, required this.items});

  @override
  void initState() {
    addButton = IconButton(
        onPressed: () {
          setState(() {
            items.add(
              builder(items.length),
            );
          });
        },
        icon: Icon(Icons.add));
    removeButton = IconButton(
        onPressed: () {
          setState(() {
            items.removeLast();
          });
        },
        icon: Icon(Icons.remove));
    items.isEmpty ? items.add(builder(0)) : false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          ...items.map((e) => Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: e,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              addButton,
              items.length > 1 ? removeButton : Container()
            ],
          )
        ]);
  }
}
