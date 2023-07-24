// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../widgets/filter_main.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = 'category_screen';
  final Map<String, bool> currentFilter;
  final Function(Map<String, bool>) saveFilter;
  CategoriesScreen({
    Key? key,
    required this.currentFilter,
    required this.saveFilter,
  }) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool isGlutenFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  bool isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey[300],
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
                    "Home",
                    style: TextStyle(
                      color: Color.fromARGB(255, 76, 12, 44),
                    ),
                  ),
                  background: Image.asset('assets/icon/akltak.png'),
                ),
                backgroundColor: Colors.red[800],
              ),
              Filter(
                currentFilter: widget.currentFilter,
                saveFilter: widget.saveFilter,
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 130,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1 / 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(7),
                      child: CategoryItem(
                        id: DUMMY_CATEGORIES[index].id,
                        categoryname: DUMMY_CATEGORIES[index].categoryname,
                        url: DUMMY_CATEGORIES[index].url,
                      ),
                    );
                  },
                  childCount: DUMMY_CATEGORIES.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
