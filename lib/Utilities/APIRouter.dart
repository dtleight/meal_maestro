import 'dart:async';
import 'dart:convert';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:http/http.dart' as http;

class APIRouter
{
  final String APP_ID = "";
  final String APP_KEY  = "";
  Future<List<FoodItem>> searchByProductName(String name) async
  {
    Uri uri = Uri.https(
        "api.edamam.com", "/api/food-database/v2/parser",
      {
        "app_id": APP_ID,
        "app_key": APP_KEY,
        "ingr": name,
      });
    List<FoodItem> results = [];
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, parse the json
      List values = json.decode(response.body)['hints'];
      values.forEach((e) => results.add(FoodItem(e['food']['label'], e['food']['foodId'],e['food']['image']??"https://image.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600w-1037719192.jpg")));
      return results;
    }
    else
    {
      //Lets us know that the api call failed
      throw Exception('Failed to load product');
    }
  }

  Future<FoodItem> getItem(String edamanID) async
  {
    Uri uri = Uri.https(
        "api.edamam.com", "/api/food-database/v2/parser",
        {
          "app_id": APP_ID,
          "app_key": APP_KEY,
          "ingr": edamanID,
        });
    final response = await http.get(uri);
    if (response.statusCode == 200)
    {
      // If the server did return a 200 OK response, parse the json
      Map<String,dynamic> item = json.decode(response.body)['hints'][0];
      return FoodItem(item['food']['label'], item['food']['foodId'],item['food']['image']??"https://image.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600w-1037719192.jpg");
    }
    else
    {
      //Lets us know that the api call failed
      throw Exception('Failed to load product');
    }
  }
}