import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function toggleFavourite;
  final Function isFavourite;

  const MealDetailScreen(this.toggleFavourite, this.isFavourite, {super.key});

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(5),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        selectedMeal.title,
      )),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).canvasColor.withAlpha(0),
                  Theme.of(context).canvasColor.withAlpha(0),
                  Theme.of(context).canvasColor.withAlpha(255),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
            ],
          ),
          buildSectionTitle(context, "Ingredients"),
          buildContainer(
            context,
            ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(selectedMeal.ingredients[index]),
              ),
            ),
          ),
          buildSectionTitle(context, "Steps"),
          buildContainer(
            context,
            ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#$index"),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavourite(mealId);
        },
      ),
    );
  }
}
