import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Utilities/APIRouter.dart';
import 'package:meal_maestro/Widgets/Search%20Delegates/ProductSearchDelegate.dart';

class PantryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PantryPageState();
  }
}

class PantryPageState extends State<PantryPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
            FutureBuilder(
              future: APIRouter().searchByProductName("Tomato"),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<FoodItem> items = snapshot.data;
                  return GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(20.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Flexible(
                                flex: 5,
                                child: Image.network(
                                  items[index].imageURL,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  items[index].name,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.green,
                  ));
                }
              },
              /**
              child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
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
                ),
                  **/
            ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Add an Item"),
                      content: Container(
                        height: 500,
                        width: 500,
                        child: Column(
                          children: [
                            TextField(),
                          ],
                        ),
                      ),
                    );
                  });
              //APIRouter().searchByProductName("potato");
            },
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
