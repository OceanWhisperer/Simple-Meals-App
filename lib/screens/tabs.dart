import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/filters.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

const kinitialfilters = {
  Filter.glutenfree: false,
  Filter.vegan: false,
  Filter.lactosefree: false,
  Filter.vegetarian: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsState();
}

class _TabsState extends State<TabsScreen> {
  int selectedpageindex = 0;

  Map<Filter, bool> selectedfilters = kinitialfilters;

  void togglemealfavouritestatus(Meal meal) {
    final isexisting = _favouritemeals.contains(meal);

    if (isexisting) {
      setState(() {
        _favouritemeals.remove(meal);
      });

      showinfomessage("meal is no longer a favourite");
    } else {
      setState(() {
        _favouritemeals.add(meal);
      });
      showinfomessage("Meal marked as favourite");
    }
  }

  final List<Meal> _favouritemeals = [];

  void showinfomessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _selectpage(index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  void _setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // what we are getting ? map of filter and bool.
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiletersScreen(
            currentfilters: selectedfilters,
          ),
        ),
      );
      setState(() {
        selectedfilters = result ?? kinitialfilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals = dummyMeals.where((meal) {
      if (selectedfilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedfilters[Filter.vegan]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedfilters[Filter.lactosefree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedfilters[Filter.vegetarian]! && !meal.isGlutenFree) {
        return false;
      }

      return true;
    }).toList();
    Widget activepage = CategoriesScreen(
      ontogglefavourites: togglemealfavouritestatus,
      availablemeals: availablemeals,
    );
    var activepagetitle = 'categories';
    if (selectedpageindex == 1) {
      activepage = MealsScreen(
        meals: _favouritemeals,
        ontogglefavourite: togglemealfavouritestatus,
      );
      activepagetitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: MainDrawer(
        onselectscreen: _setscreen,
      ),
      body: activepage,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
        child: BottomNavigationBar(
          currentIndex: selectedpageindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourites',
            ),
          ],
          onTap: _selectpage,
        ),
      ),
    );
  }
}
