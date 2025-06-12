import 'package:flutter/material.dart';
import 'package:food_catalog_app/data/food_list.dart';
import 'package:food_catalog_app/widgets/food_card.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatefulWidget {
  final List<FoodItem> favoriteFoods;

  final Function(FoodItem) onFavoriteToggle;

  const FavoritesScreen({
    Key? key,
    required this.favoriteFoods,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favourite Recipes')),
      body: widget.favoriteFoods.isEmpty
          ? const Center(
              child: Text(
                "No favorite recipies yet!",
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
              itemCount: widget.favoriteFoods.length,
              itemBuilder: (context, index) {
                final food = widget.favoriteFoods[index];
                return FoodCard(
                  food: food,
                  onFavoriteToggle: () {
                    widget.onFavoriteToggle(food);
                    setState(() {});
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
