import 'package:balanced_meal/Features/food_order/data/models/meal_model/meal_model.dart';
import 'package:balanced_meal/core/styles/fonts_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/order_meal_view_model.dart';
import 'rounded_button.dart';

class CustomContainer extends StatelessWidget {
  final MealModel meal;
  final int quantity;
  const CustomContainer(
      {super.key, required this.meal, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: double.infinity,
        height: 78,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0x3D898989), // #8989893D
              blurRadius: 15.5,
              offset: const Offset(3, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 76,
              height: 62,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Change as needed
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  meal.imageUrl!,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${meal.foodName}",
                        style: AppTextStyles.poppins16,
                      ),
                      Text(
                        "\$${meal.salary}",
                        style: AppTextStyles.poppins16Bold,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textWidthBasis: TextWidthBasis.longestLine,
                        "${meal.calories} Cal",
                        style: AppTextStyles.poppins14,
                      ),
                      SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedButton(
                              text: "-",
                              onPressed: () => Provider.of<OrderMealViewModel>(
                                      context,
                                      listen: false)
                                  .decrementMeal(meal),
                            ),
                            Flexible(
                              child: Text(
                                "$quantity",
                                style: AppTextStyles.poppins16Bold,
                              ),
                            ),
                            RoundedButton(
                              text: "+",
                              onPressed: () => Provider.of<OrderMealViewModel>(
                                      context,
                                      listen: false)
                                  .incrementMeal(meal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
