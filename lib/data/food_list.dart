class FoodItem {
  final String id;
  final String name;
  final String description;
  final String image;
  final List<String> ingredients;
  final String instructions;
  bool isFavorite;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });
}

List<FoodItem> foodList = [
  FoodItem(
    id: '1',
    name: 'Pizza Margherita',
    description: 'Very spicy and extra suasage filled pizza',
    image: 'assets/pizza.png',
    ingredients: [
      'Pizza Dough',
      'Tomato Sauce',
      'Mozzarella Cheese',
      'Fresh Basil',
      'Olive Oil',
    ],
    instructions:
        '1. Preheat oven to 220°C. 2. Spread sauce on dough, add cheese. 3. Bake for 12-15 minutes until crust is golden. 4. Top with fresh basil.',
  ),
  FoodItem(
    id: '2',
    name: 'Burger',
    description: 'Double patty cheesy veg Burger',
    image: 'assets/burger.png',
    ingredients: [
      'Burger Bun',
      'Beef Patty',
      'Lettuce',
      'Tomato',
      'Onion',
      'Pickles',
      'Ketchup',
      'Mayonnaise',
    ],
    instructions:
        '1. Grill patties to desired doneness. 2. Toast buns. 3. Assemble burger with desired toppings. 4. Serve hot with fries.',
  ),
  FoodItem(
    id: '3',
    name: 'Pasta',
    description: 'Too Yummy hot and sweet pasta',
    image: 'assets/pasta.png',
    ingredients: [
      'pasta',
      'cheese',
      'oil',
      'onions',
      'chillies',
      'chilli powder',
      'salt',
    ],
    instructions:
        '1. Cook spaghetti. 2. Fry guanciale until crispy. 3. Whisk eggs with cheese and pepper. 4. Combine cooked pasta with guanciale, then quickly mix in egg mixture until creamy.',
  ),
  FoodItem(
    id: '4',
    name: 'Chicken curry',
    description: 'Hyderabady chicken curry with extra spice',
    image: 'assests/curry.png',
    ingredients: [
      'chicken',
      'oil',
      'salt',
      'chilli powder',
      'onion',
      'chillies',
      'water',
      'masalas',
    ],
    instructions:
        '1. Sauté onions, garlic, ginger. 2. Add chicken and curry powder, cook until browned. 3. Stir in tomatoes and coconut milk, simmer until chicken is cooked through. 4. Garnish with cilantro.',
  ),
  FoodItem(
    id: '5',
    name: 'tacos',
    description: 'delightful very crispy and crunchy tacos',
    image: 'assets/tacos.png',
    ingredients: [
      'Tortillas',
      'Ground Beef',
      'Taco Seasoning',
      'Lettuce',
      'Salsa',
      'Sour Cream',
      'Cheese',
    ],
    instructions:
        '1. Cook ground beef with taco seasoning. 2. Warm tortillas. 3. Fill tortillas with beef, lettuce, salsa, sour cream, and cheese.',
  ),
];
