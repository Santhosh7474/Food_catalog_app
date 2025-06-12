import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_catalog_app/data/food_list.dart';
import 'package:food_catalog_app/screens/home_screen.dart';
import 'package:food_catalog_app/screens/favorites_screen.dart';
import 'package:food_catalog_app/screens/recipe_detail_screen.dart';

void main() {
  runApp(const FoodCatalogApp());
}

class FoodCatalogApp extends StatefulWidget {
  const FoodCatalogApp({super.key});

  @override
  State<FoodCatalogApp> createState() => _FoodCatalogAppState();
}

class _FoodCatalogAppState extends State<FoodCatalogApp> {
  int _selectedIndex = 0;

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => RootScreen(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            onFavoriteToggle: _handleFavoriteToggle,
          ),
        ),

        GoRoute(
          path: '/details/:id',
          builder: (context, state) {
            final foodId = state.pathParameters['id'];

            final FoodItem? selectedFood = foodList.firstWhere(
              (food) => food.id == foodId,
              orElse: () => FoodItem(
                id: 'error',
                name: 'Recipe Not Found',
                description: 'The requested recipe could not be found.',
                image: 'assets/placeholder.png',
                ingredients: [],
                instructions: '',
              ),
            );
            return RecipeDetailScreen(food: selectedFood!);
          },
        ),
      ],
    );
  }

  void _handleFavoriteToggle(FoodItem toggledFood) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Food Catalog App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class RootScreen extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChange;
  final Function(FoodItem) onFavoriteToggle;

  const RootScreen({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _initScreens();
  }

  @override
  void didUpdateWidget(covariant RootScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onFavoriteToggle != oldWidget.onFavoriteToggle ||
        widget.selectedIndex != oldWidget.selectedIndex) {
      _initScreens();
    }
  }

  void _initScreens() {
    _screens = [
      HomeScreen(onFavoriteToggle: widget.onFavoriteToggle),
      FavoritesScreen(
        favoriteFoods: foodList.where((food) => food.isFavorite).toList(),
        onFavoriteToggle: widget.onFavoriteToggle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[widget.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.selectedIndex,
        onTap: widget.onTabChange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
