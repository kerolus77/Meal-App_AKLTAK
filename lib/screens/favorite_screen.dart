// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  List<Meal> favoriteMeal;
  FavoriteScreen({
    Key? key,
    required this.favoriteMeal,
  }) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  void initState() {
    setState(() {
      widget.favoriteMeal;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeal.isEmpty) {
      return const Text(
        'You Have No Favorite Yet',
        style: TextStyle(
            color: Color.fromARGB(255, 81, 75, 75),
            fontSize: 15,
            fontWeight: FontWeight.bold),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: MediaQuery.of(context).size.height / 4,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(bottom: 16, left: 5),
                    title: const Text(
                      "Favorite",
                      style: TextStyle(
                        color: Color.fromARGB(255, 76, 12, 44),
                      ),
                    ),
                    background: Image.asset('assets/icon/akltak.png'),
                  ),
                  backgroundColor: Colors.red[800],
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MealItem(
                          mealName: widget.favoriteMeal[index].mealName,
                          affordability:
                              widget.favoriteMeal[index].affordability,
                          complexity: widget.favoriteMeal[index].complexity,
                          imageUrl: widget.favoriteMeal[index].imageUrl,
                          id: widget.favoriteMeal[index].id,
                        ),
                      );
                    },
                    childCount: widget.favoriteMeal.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
