import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsState();
}

class _TabsState extends State<TabsScreen> {
  int selectedpageindex = 0;

  void _selectpage(index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage = const CategoriesScreen();
    var activepagetitle = 'categories';
    if (selectedpageindex == 1) {
      activepage = const MealsScreen(meals: []);
      activepagetitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
