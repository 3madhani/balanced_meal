import 'package:balanced_meal/Features/food_order/data/models/meal_model/meal_model.dart';
import 'package:balanced_meal/core/styles/colors.dart';
import 'package:balanced_meal/core/styles/fonts_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/order_meal_view_model.dart';
import 'rounded_button.dart';

class FoodCard extends StatelessWidget {
  final MealModel mealModel;

  const FoodCard({
    super.key,
    required this.mealModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 12.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 183,
          maxHeight: 196,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color(0x3D898989), // Equivalent to #8989893D
              offset: Offset(3, 4), // X and Y offsets
              blurRadius: 15.5, // Blur radius
              spreadRadius: 0, // Spread radius
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 163,
              height: 108,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: mealModel.imageUrl == null
                    ? null
                    : DecorationImage(
                        image: NetworkImage(mealModel.imageUrl!.isNotEmpty
                            ? mealModel.imageUrl!
                            : ''),
                        fit: BoxFit.cover,
                      ),
                color: Color(0xFFEAECF0),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    mealModel.foodName!,
                    style: AppTextStyles.poppins16,
                  ),
                ),
                Flexible(
                  child: Text(
                    "${mealModel.calories} Cal",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppins14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$${mealModel.salary.toInt()}",
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppins16Bold,
                  ),
                ),
                Consumer<OrderMealViewModel>(
                  builder: (context, viewModel, child) {
                    final isAdded =
                        viewModel.orderMealList.containsKey(mealModel);
                    final quantity = viewModel.orderMealList[mealModel] ?? 0;
                    return isAdded
                        ? SizedBox(
                            width: 80,
                            height: 32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoundedButton(
                                  text: "-",
                                  onPressed: () =>
                                      viewModel.decrementMeal(mealModel),
                                ),
                                Flexible(
                                  child: Text(
                                    "$quantity",
                                    style: AppTextStyles.poppins16Bold,
                                  ),
                                ),
                                RoundedButton(
                                  text: "+",
                                  onPressed: () =>
                                      viewModel.incrementMeal(mealModel),
                                ),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () => viewModel.addMeal(mealModel),
                            child: Container(
                              height: 32,
                              width: 65,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  "Add",
                                  style: AppTextStyles.poppins16.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
