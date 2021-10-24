
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_maestro/Objects/FoodItem.dart';
import 'package:meal_maestro/Objects/Ingredient.dart';
import 'package:meal_maestro/Objects/OwnedIngredient.dart';
import 'package:meal_maestro/Objects/Quantity.dart';
import 'package:meal_maestro/Objects/Recipe.dart';

import 'APIRouter.dart';

class DatabaseRouter
{
  String uid = FirebaseAuth.instance.currentUser!.uid;

  Future<List<Recipe>> getPersonalRecipes() async
  {
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    List<String> recipeIds = List<String>.from(ds.get("personal_recipes"));
    List<Recipe> recipes = [];
    for(String recipeId in recipeIds)
      {
        DocumentSnapshot rs = await FirebaseFirestore.instance.collection("recipes").doc(recipeId).get();
        List<Ingredient> ingredients = rs.get("ingredients").map((e)
        {
          e = Ingredient.fromDatabase(e);
        }).toList();

        recipes.add(
            Recipe(
              rs.get("name"),
              rs.get("image_src"),
              rs.get("serving_size"),
              ingredients,
              List<String>.from(rs.get("instructions"))
            )
        );
      }
    return [];
  }

  Future<List<OwnedIngredient>> getPantry() async
  {
    List<OwnedIngredient> pantry = [];
    QuerySnapshot ps = await FirebaseFirestore.instance.collection("users").doc(uid).collection('pantry').get();
    for(DocumentSnapshot doc in ps.docs)
      {
        FoodItem food = await APIRouter().getItem(doc.get("edamanID"));
        Map<String,dynamic> qMap = doc.get("quantity");
        //Get name, photoURL from edamanID
        pantry.add(new OwnedIngredient(food.name, doc.get("edamanID"), food.imageURL, Quantity(qMap["value"], MeasurementUnits.values[qMap['type']]), (doc.get("expirationDate") as Timestamp).toDate()));
      }
    return pantry;
  }

  Future<void> addToPantry(OwnedIngredient item) async
  {
    FirebaseFirestore.instance.collection('users').doc(uid).collection("pantry").add(
      {
        "edamanID": item.edamamID,
        "expirationDate": item.expirationDate,
         "quantity": item.quantity.toMap(),
      }
    );
  }

  Future<void> addPersonalRecipe(String name, String imageUrl, int servingSize, List<Ingredient> ingredients, List<String> instructions) async
  {
    //Fill this in later with ingredient fuzzification
    DocumentReference recipeRef = await FirebaseFirestore.instance.collection("recipes").add(
      {
        "name": name,
        "imageUrl": imageUrl,
        "servingSize": servingSize,

      }
    );
  }
}