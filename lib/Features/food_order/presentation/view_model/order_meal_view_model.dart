import 'package:balanced_meal/Features/food_order/data/models/meal_model/meal_model.dart';
import 'package:flutter/material.dart';

class OrderMealViewModel extends ChangeNotifier {
  final Map<MealModel, int> _orderMealList =
      {}; // Stores meal object & quantity

  double _totalSalary = 0.0;
  double _totalCalories = 0.0;
  double _dailyCaloricNeed = 0.0; // Default caloric need

  double get calorieRatio =>
      _dailyCaloricNeed > 0 ? (_totalCalories / _dailyCaloricNeed) : 0.0;
  Map<MealModel, int> get orderMealList => _orderMealList;
  double get totalCalories => _totalCalories;
  double get totalSalary => _totalSalary;
  double get dailyCaloricNeed => _dailyCaloricNeed;

  /// Add a meal with initial quantity 1
  void addMeal(MealModel meal) {
    if (_orderMealList.containsKey(meal)) {
      _orderMealList[meal] = _orderMealList[meal]! + 1;
    } else {
      _orderMealList[meal] = 1;
    }
    _calculateTotals();
  }

  /// Decrement meal quantity or remove if zero
  void decrementMeal(MealModel meal) {
    if (_orderMealList.containsKey(meal)) {
      if (_orderMealList[meal]! > 1) {
        _orderMealList[meal] = _orderMealList[meal]! - 1;
      } else {
        _orderMealList.remove(meal);
      }
      _calculateTotals();
    }
  }

  /// Increment meal quantity
  void incrementMeal(MealModel meal) {
    if (_orderMealList.containsKey(meal)) {
      _orderMealList[meal] = _orderMealList[meal]! + 1;
      _calculateTotals();
    }
  }

  /// Set daily caloric need
  void setDailyCaloricNeed(double calories) {
    _dailyCaloricNeed = calories;
    notifyListeners();
  }

  /// Recalculate total salary & total calories
  void _calculateTotals() {
    _totalSalary = 0.0;
    _totalCalories = 0.0;
    _orderMealList.forEach((meal, quantity) {
      _totalSalary += meal.salary * quantity;
      _totalCalories += meal.calories! * quantity;
    });
    notifyListeners();
  }
}
