import 'package:flutter/material.dart';
import 'package:flutter_meal_apps/widgets/mainDrawer.dart';

import '../models/meal.dart';
import 'favouritesScreen.dart';

import 'categoriesScreen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favMeals;

  TabScreen(this.favMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(widget.favMeals),
        'title': 'Favourites',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages.elementAt(_selectedPageIndex)['title']),
      ),
      drawer: MainDrawer(),
      body: _pages.elementAt(_selectedPageIndex)['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
