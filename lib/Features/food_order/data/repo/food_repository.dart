import 'package:balanced_meal/Features/food_order/data/models/meal_model/meal_model.dart';
import 'package:balanced_meal/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<MealModel>>> getCarbs();
  Future<Either<Failure, List<MealModel>>> getMeat();
  Future<Either<Failure, List<MealModel>>> getVegetables();
}
