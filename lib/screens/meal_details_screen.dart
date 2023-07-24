// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_details.dart';

import '../widgets/circle_button.dart';

class MealDetailsScreen extends StatefulWidget {
  static const routename = 'mealDetails';
  final Function(String mealId) addRemoveFavorite;
  final Function(String mealId) isFavorite;
  const MealDetailsScreen({
    Key? key,
    required this.addRemoveFavorite,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    // ignore: unused_local_variable
    final meal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[800],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleButton(
                icon: Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                textIcon: Colors.red[800]!,
                select: selectCategory,
              ),
              MealDetails(
                id: mealId,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.addRemoveFavorite(mealId);
              });
            },
            child: Icon(widget.isFavorite(mealId)
                ? Icons.favorite
                : Icons.favorite_border),
            backgroundColor: Colors.red[800]),
      ),
    );
  }
}
