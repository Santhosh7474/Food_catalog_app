import 'package:flutter/material.dart';
import 'package:food_catalog_app/data/food_list.dart';
import 'package:food_catalog_app/widgets/food_card.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  final Function(FoodItem) onFavoriteToggle;

  const HomeScreen({Key? key, required this.onFavoriteToggle})
    : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  List<FoodItem> _filteredFoodList = [];

  @override
  void initState() {
    super.initState();
    _filteredFoodList = List.from(foodList);
    _searchController.addListener(_filteredRecipies);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filteredRecipies() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      if (query.isEmpty) {
        _filteredFoodList = List.from(foodList);
      } else {
        _filteredFoodList = foodList.where((food) {
          return food.name.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Catalog'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search recipes...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
        ),
      ),
      body: _filteredFoodList.isEmpty
          ? const Center(
              child: Text(
                "No recipes found.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: _filteredFoodList.length,
              itemBuilder: (context, index) {
                final food = _filteredFoodList[index];
                return FoodCard(
                  food: food,
                  onFavoriteToggle: () {
                    widget.onFavoriteToggle(food);
                  },
                  onTap: () {
                    context.go('/details/${food.id}');
                  },
                );
              },
            ),
    );
  }
}
