import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/dummy_data.dart';

final mealsprovider = Provider((ref) {
  return dummyMeals;
});
