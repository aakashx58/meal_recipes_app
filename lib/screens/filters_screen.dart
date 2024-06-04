import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final Function(Map<String, bool>) setFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.setFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"] as bool;
    _vegetarian = widget.currentFilters["vegetarian"] as bool;
    _vegan = widget.currentFilters["vegan"] as bool;
    _lactoseFree = widget.currentFilters["lactose"] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentVal,
      Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentVal,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("Filtered Meals"),
        actions: [
          IconButton(
              onPressed: () {
                widget.setFilters({
                  "gluten": _glutenFree,
                  "vegetarian": _vegetarian,
                  "vegan": _vegan,
                  "lactose": _lactoseFree,
                });
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Adjust your meals selection",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _buildSwitchListTile(
                "Gluten-free",
                "Only include Gluten-free meals",
                _glutenFree,
                (value) {
                  setState(
                    () {
                      _glutenFree = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Vegetarian",
                "Only include Vegentarian meals",
                _vegetarian,
                (value) {
                  setState(
                    () {
                      _vegetarian = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Vegan",
                "Only include Vegan meals",
                _vegan,
                (value) {
                  setState(
                    () {
                      _vegan = value;
                    },
                  );
                },
              ),
              _buildSwitchListTile(
                "Lactose-free",
                "Only include Lactose-free meals",
                _lactoseFree,
                (value) {
                  setState(
                    () {
                      _lactoseFree = value;
                    },
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
