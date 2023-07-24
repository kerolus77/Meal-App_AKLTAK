// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'filter_button.dart';

class Filter extends StatefulWidget {
  final Function(Map<String, bool>) saveFilter;
  final Map<String, bool> currentFilter;
  const Filter({
    Key? key,
    required this.saveFilter,
    required this.currentFilter,
  }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool isGlutenFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  bool isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.currentFilter['gluten']!;

    isVegan = widget.currentFilter['vegan']!;

    isVegetarian = widget.currentFilter['vegetarian']!;

    isLactoseFree = widget.currentFilter['lactose']!;
    super.initState();
  }

  void test() {
    Map<String, bool> _filter = {
      'gluten': isGlutenFree,
      'vegan': isVegan,
      'vegetarian': isVegetarian,
      'lactose': isLactoseFree,
    };
    print(isGlutenFree);
    widget.saveFilter(_filter);
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                FilterButton(
                  filterName: 'Gluten Free',
                  event: () {
                    setState(() {
                      isGlutenFree = !isGlutenFree;

                      test();
                    });
                  },
                  newElevated: isGlutenFree,
                ),
                FilterButton(
                    filterName: 'Vegan',
                    event: () {
                      setState(() {
                        isVegan = !isVegan;
                        test();
                      });
                    },
                    newElevated: isVegan),
                FilterButton(
                    filterName: 'Vegetarian',
                    event: () {
                      setState(() {
                        isVegetarian = !isVegetarian;
                        test();
                      });
                    },
                    newElevated: isVegetarian),
                FilterButton(
                    filterName: 'Lactose Free',
                    event: () {
                      setState(() {
                        isLactoseFree = !isLactoseFree;
                        test();
                      });
                    },
                    newElevated: isLactoseFree),
              ],
            ),
          ],
        ),
      );
    }, childCount: 1));
  }
}
