import 'package:balanced_meal/Features/food_order/data/models/meal_model/meal_model.dart';
import 'package:balanced_meal/Features/food_order/data/repo/food_repository.dart';
import 'package:balanced_meal/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class FoodViewModel extends ChangeNotifier {
  final FoodRepository foodRepository;

  List<MealModel> _carbs = [];

  List<MealModel> _meat = [];
  List<MealModel> _vegetables = [];
  bool _isLoading = false;
  String? _error;
  FoodViewModel({required this.foodRepository});

  List<MealModel> get carbs => _carbs;
  String? get error => _error;
  bool get isLoading => _isLoading;
  List<MealModel> get meat => _meat;
  List<MealModel> get vegetables => _vegetables;

  Future<void> fetchCarbs() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    Either<Failure, List<MealModel>> result = await foodRepository.getCarbs();
    result.fold(
      (failure) => _error = failure.errMessage,
      (data) => _carbs = data,
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMeat() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    Either<Failure, List<MealModel>> result = await foodRepository.getMeat();
    result.fold(
      (failure) => _error = failure.errMessage,
      (data) => _meat = data,
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchVegetables() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    Either<Failure, List<MealModel>> result =
        await foodRepository.getVegetables();
    result.fold(
      (failure) => _error = failure.errMessage,
      (data) => _vegetables = data,
    );

    _isLoading = false;
    notifyListeners();
  }
}
