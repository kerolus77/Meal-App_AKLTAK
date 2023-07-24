import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meal.dart';

class CategoryItem extends StatefulWidget {
  final String id;
  final String categoryname;
  final String url;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.categoryname,
    required this.url,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeal.routeName, arguments: {
      'id': id,
      'categoryName': categoryname,
    });
  }

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) => setState(() {
        _isElevated = true;
        widget.selectCategory(context);
      }),
      onPointerDown: (_) => setState(() {
        _isElevated = false;
      }),
      child: AnimatedContainer(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: _isElevated
                ? [
                    BoxShadow(
                      color: Colors.grey[500]!,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 3,
                    ),
                  ]
                : null),
        duration: const Duration(microseconds: 200),
        child: Column(
          children: [
            Image.asset(
              widget.url,
              width: 45,
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
                child: Text(
              widget.categoryname,
              style: Theme.of(context).textTheme.titleMedium,
            )),
          ],
        ),
      ),
    );
  }
}
