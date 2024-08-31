import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.ontogglefavourites,
      required this.availablemeals});
  final void Function(Meal meal) ontogglefavourites;
  final List<Meal> availablemeals;

  void _selectcategory(BuildContext context, Category category) {
    final filteredlist = availablemeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredlist,
          ontogglefavourite: ontogglefavourites,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 120,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onselectcategory: () {
              _selectcategory(context, category);
            },
          )
      ],
    );
  }
}
