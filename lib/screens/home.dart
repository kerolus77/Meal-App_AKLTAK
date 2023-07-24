// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:meal_app/screens/categories_screen.dart';

import '../models/meal.dart';
import 'favorite_screen.dart';

class Home extends StatefulWidget {
  final Function(Map<String, bool>) saveFilter;
  final Map<String, bool> currentFilter;
  List<Meal> favoriteMeal;
  Home({
    Key? key,
    required this.saveFilter,
    required this.currentFilter,
    required this.favoriteMeal,
  }) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Widget>> _widgetOptions = [
      {
        'page': CategoriesScreen(
          currentFilter: widget.currentFilter,
          saveFilter: widget.saveFilter,
        ),
      },
      {
        'page': FavoriteScreen(favoriteMeal: widget.favoriteMeal),
      },
    ];
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex]['page'],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.red[800]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home_sharp,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
