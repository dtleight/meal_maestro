
import 'dart:io';

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
        List<Map<String,dynamic>> ingredientData = List<Map<String,dynamic>>.from(rs.get("ingredients"));
        List<Ingredient> ingredients = List<Ingredient>.generate(ingredientData.length, (int index){return Ingredient.fromDatabase(ingredientData[index]);});
        recipes.add(
            Recipe(
              rs.get("name"),
              rs.get("imageUrl"),
              rs.get("servingSize"),
              ingredients,
              List<String>.from(rs.get("instructions")),
              id: rs.id,
            )
        );
      }
    return recipes;
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

  //Future<void> addPersonalRecipe(String name, String imageUrl, int servingSize, List<Ingredient> ingredients, List<String> instructions) async
  Future<void> addPersonalRecipe(Recipe r) async
      {
    //Fill this in later with ingredient fuzzification
    DocumentReference recipeRef = await FirebaseFirestore.instance.collection("recipes").add(
      {
        "name": r.name,
        "imageUrl": r.imageSrc,
        "servingSize": r.servingSize,
        "instructions": r.steps,
        "ingredients": List<Map<String,dynamic>>.generate(r.ingredients.length,
                (int index) {
                  return {
                    "edamanID": r.ingredients[index].edamamID,
                    "measurementType": r.ingredients[index].quantity.type.index,
                    "quantity": r.ingredients[index].quantity.value
                  };
                }
        ),
        "posterUID": uid,
      }
    );
    //Add recipe to user collection
    DocumentReference userRef = FirebaseFirestore.instance.collection("users").doc(uid);
    DocumentSnapshot userSnapshot = await userRef.get();
    List<String> recipeList = List<String>.from(
        userSnapshot.get("personal_recipes").map((e) => e.toString()));
    recipeList.add(recipeRef.id);
    userRef.update({
      'personal_recipes': recipeList,
    });
  }

  Future<void> addMeal(DateTime day, List<Recipe> recipe) async
  {

    //Generate meal in meals collection
    //Add meal id to users meals collection
  }
}