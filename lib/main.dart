import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/category_meal.dart';
import '../screens/home.dart';
import '../screens/meal_details_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  final List<Meal> _favoriteMeal = [];
  void _setFilter(Map<String, bool> _filterData) {
    setState(() {
      _filter = _filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filter['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filter['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void addRemoveFavorite(String mealId) {
    // ignore: no_leading_underscores_for_local_identifiers
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite(String mealId) {
      return _favoriteMeal.any((meal) => meal.id == mealId);
    }

    return MaterialApp(
      theme: ThemeData(
          canvasColor: Colors.grey[300],
          primaryColor: Colors.red[800],
          textTheme: ThemeData.light().textTheme.copyWith(
              // bodyMedium:
              //     TextStyle(),
              titleMedium: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              titleLarge:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),

      debugShowCheckedModeBanner: false,
      // home: const Home(),
      routes: {
        '/': (context) => Home(
            favoriteMeal: _favoriteMeal,
            currentFilter: _filter,
            saveFilter: _setFilter),
        CategoryMeal.routeName: (context) =>
            CategoryMeal(availableMeal: _availableMeal),
        CategoriesScreen.routeName: (context) =>
            CategoriesScreen(currentFilter: _filter, saveFilter: _setFilter),
        MealDetailsScreen.routename: (context) => MealDetailsScreen(
              addRemoveFavorite: addRemoveFavorite,
              isFavorite: isFavorite,
            )
      },
    );
  }
}
