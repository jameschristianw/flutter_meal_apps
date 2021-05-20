import 'package:flutter/material.dart';
import 'package:flutter_meal_apps/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen({
  //   Key key,
  //   this.categoryId,
  //   this.categoryTitle,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          title: categoryMeals.elementAt(index).title,
          imageUrl: categoryMeals.elementAt(index).imageUrl,
          duration: categoryMeals.elementAt(index).duration,
          complexity: categoryMeals.elementAt(index).complexity,
          affordability: categoryMeals.elementAt(index).affordability,
          id: categoryMeals.elementAt(index).id,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
