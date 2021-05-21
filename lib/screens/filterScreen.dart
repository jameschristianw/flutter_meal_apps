import 'package:flutter/material.dart';
import 'package:flutter_meal_apps/widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = 'filters';

  final Function saveFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  Widget _buildListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isGlutenFree = widget.currentFilters['glutten'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isLactoseFree = widget.currentFilters['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _filters = {
                  'glutten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilter(_filters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                    "Glutten-free",
                    "Only include glutten-free meals",
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                _buildListTile(
                    "Lactose-free",
                    "Only include Lactose-free meals",
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                _buildListTile("Vegan", "Only include Vegan meals", _isVegan,
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                _buildListTile("Vegetarian", "Only include Vegetarian meals",
                    _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
