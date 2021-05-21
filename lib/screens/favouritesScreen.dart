import 'package:flutter/material.dart';
import 'package:flutter_meal_apps/widgets/mealItem.dart';

import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favMeals;

  FavouritesScreen(this._favMeals);

  @override
  Widget build(BuildContext context) {
    if (_favMeals.isEmpty)
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    else {
      return ListView.builder(
        itemBuilder: (context, index) => MealItem(
          title: _favMeals.elementAt(index).title,
          imageUrl: _favMeals.elementAt(index).imageUrl,
          duration: _favMeals.elementAt(index).duration,
          complexity: _favMeals.elementAt(index).complexity,
          affordability: _favMeals.elementAt(index).affordability,
          id: _favMeals.elementAt(index).id,
        ),
        itemCount: _favMeals.length,
      );
    }
  }
}
