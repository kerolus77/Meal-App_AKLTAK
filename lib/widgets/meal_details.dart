// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  final String id;
  const MealDetails({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final meal = DUMMY_MEALS.firstWhere((meal) => id == meal.id);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 1.4,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: size.height * 0.2),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 150, left: 15),
                        child: Text(
                          meal.mealName,
                          // style: Theme.of(context).textTheme.titleLarge,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                '${meal.duration}min',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.whatshot_outlined,
                                color: Colors.red[800],
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                ' ${meal.calories} kcal',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                      titel('Ingredients'),
                      containerDetails(
                        ListView.builder(
                          controller: ScrollController(),
                          itemBuilder: (context, index) {
                            return Card(
                              shadowColor: Colors.grey[500],
                              color: Colors.grey[300],
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Text(meal.ingredients[index],
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ),
                            );
                          },
                          itemCount: meal.ingredients.length,
                        ),
                      ),
                      titel('Steps'),
                      const Divider(
                        height: 2,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.only(top: 10),
                            //padding: EdgeInsets.all(10),
                            height: size.height - 500,
                            // width: double
                            //  .infinity, // Adjust the height according to your needs
                            child: ListView.builder(
                              controller: ScrollController(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    radius: 10,
                                    child: Text('${index + 1}'),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child: Text(meal.steps[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                  ),
                                );
                              },
                              itemCount: meal.steps.length,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          meal.imageUrl,
                          width: MediaQuery.of(context).size.width / 1.6,
                          height: MediaQuery.of(context).size.height / 2.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget titel(String str) {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 5),
      child: Text(
        str,
        // style: Theme.of(context).textTheme.titleLarge,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget containerDetails(Widget details) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
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
                ],
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            //padding: EdgeInsets.all(10),
            height: 200,
            width: 300, // Adjust the height according to your needs
            child: details),
      ],
    );
  }
}
