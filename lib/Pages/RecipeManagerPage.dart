import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeManagerPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return RecipeManagerPageState();
  }
}

class RecipeManagerPageState extends State<RecipeManagerPage>
{
  @override
  Widget build(BuildContext context)
  {
    return ListView
      (
      padding: EdgeInsets.all(20),
      scrollDirection: Axis.vertical,
      children: 
      List.generate(15,
      (index)
        {
        return ListTile(
        tileColor: Colors.white,
        leading: Container(
        width: 100,
        height: 100,
        child: Image.network("https://image.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600w-1037719192.jpg", fit: BoxFit.fill,),),
        title: Text("Recipe Name"),);
        })
    );
  }

}