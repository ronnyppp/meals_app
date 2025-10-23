import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/models/meal.dart';

class FavortieMealsNotifier extends StateNotifier<List<Meal>> {
  FavortieMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite) {
      // create new list that excludes meal to remove from favorites
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // set list by combining all past values of list and newly favorited meal
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavortieMealsNotifier, 
List<Meal>>((ref) {
  return FavortieMealsNotifier();
});