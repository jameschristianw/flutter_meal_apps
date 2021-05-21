import 'package:flutter/material.dart';
import 'package:flutter_meal_apps/widgets/categoryItem.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              id: catData.id,
              title: catData.title,
              bgColor: catData.color,
            ),
          )
          .toList(),
    );
  }
}
