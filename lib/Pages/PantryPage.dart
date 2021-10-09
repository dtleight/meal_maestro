import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PantryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PantryPageState();
  }
}

//BRB
class PantryPageState extends State<PantryPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(20.0),
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: List.generate(
        20,
        (index) {
          return Container(
            height: 200,
            width: 200,
            color: Colors.white,
            child: Column(
              children: [
                Image.network(
                  "https://image.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600w-1037719192.jpg",
                  fit: BoxFit.fill,
                ),
                Text("Product Name")
              ],
            ),
          );
        },
      ),
    );
  }
}
