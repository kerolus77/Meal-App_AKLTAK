// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meal_app/widgets/circle_button.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = 'category_meal';
  List<Meal> availableMeal;
  CategoryMeal({
    Key? key,
    required this.availableMeal,
  }) : super(key: key);

  @override
  State<CategoryMeal> createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryName = routeArg['categoryName'];
    final meals = widget.availableMeal.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleButton(
              icon: Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              textIcon: Colors.red[800]!,
              select: selectCategory,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 15),
                child: Text(
                  '$categoryName',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemBuilder: ((context, index) {
                  return MealItem(
                    mealName: meals[index].mealName,
                    affordability: meals[index].affordability,
                    complexity: meals[index].complexity,
                    imageUrl: meals[index].imageUrl,
                    id: meals[index].id,
                  );
                }),
                itemCount: meals.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
