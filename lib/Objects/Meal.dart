import 'Recipe.dart';

class Meal
{
  String title;
  DateTime date;
  List<Recipe> recipes;
  int priorityIndex;
  String? id;

  Meal(this.title, this.date, this.recipes, this.priorityIndex, {this.id});
}