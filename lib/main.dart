import 'package:flutter/material.dart';

import './dummy_data.dart';
import './app_theme.dart';
import './screens/tabs_screens.dart';
import './screens/filters_screen.dart';
import './screens/cateogry_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "vegetarian": false,
    "vegan": false,
    "lactose": false,
  };

  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favouriteMeals = [];

  void _toogleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavourite(mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters["gluten"]! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["vegetarian"]! && !meal.isVegetarian) {
          return false;
        }
        if (_filters["vegan"]! && !meal.isVegan) {
          return false;
        }
        if (_filters["lactose"]! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DemiMeals",
      theme: appTheme(context),
      //home: const TabsScreen(),
      routes: {
        "/": (context) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toogleFavourite, _isFavourite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
