import 'package:balanced_meal/Features/food_order/data/models/meal_model/meal_model.dart';
import 'package:balanced_meal/Features/food_order/presentation/views/widgets/food_card.dart';
import 'package:flutter/material.dart';

class MealList extends StatelessWidget {
  final List<MealModel> mealModel;
  const MealList({
    super.key,
    required this.mealModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222,
      child: ListView.builder(
          itemCount: mealModel.length,
          padding: const EdgeInsets.only(left: 8),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FoodCard(
              mealModel: mealModel[index],
            );
          }),
    );
  }
}
