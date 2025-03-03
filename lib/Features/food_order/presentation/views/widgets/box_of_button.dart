import 'package:balanced_meal/Features/food_order/presentation/views/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import '../../../../../core/constants/app_sizes.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts_styles.dart';

class BoxOfButton extends StatelessWidget {
  final double numOfCaloriesNeeded; // Total required calories
  final double sumOfCalories; // Calories from the ordered meals
  final int price;

  const BoxOfButton({
    super.key,
    required this.numOfCaloriesNeeded,
    required this.price,
    required this.sumOfCalories,
  });

  @override
  Widget build(BuildContext context) {
    double ratio = sumOfCalories / numOfCaloriesNeeded;
    ratio =
        ratio.clamp(0.0, 1.2); // Ensuring it doesn't go below 0% or exceed 120%

    // Dynamic color based on calorie intake
    Color progressColor = ratio <= 1.0
        ? AppColors.primaryColor.withOpacity(
            ratio,
          )
        : AppColors.primaryColor;
    String progressText = ratio <= 1.0 ? "On Track" : "Exceeded";

    return Container(
      width: double.infinity,
      height: 170,
      padding: const EdgeInsets.all(AppSizes.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x30DEDEDE),
            offset: Offset(0, -9),
            blurRadius: 15.5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cal", style: AppTextStyles.poppins16),
              Row(
                children: [
                  Text(
                    "${sumOfCalories.toInt()}",
                    style: AppTextStyles.poppins14.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(" Cal out of ", style: AppTextStyles.poppins14),
                  Text(
                    "${numOfCaloriesNeeded.toInt()}",
                    style: AppTextStyles.poppins14.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(" Cal", style: AppTextStyles.poppins14),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price", style: AppTextStyles.poppins16),
              Text(
                "\$ $price",
                style: AppTextStyles.poppins16Bold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // 🟢 Liquid Progress Bar
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, OrderSummary.routeName);
            },
            child: SizedBox(
              height: 60,
              child: LiquidLinearProgressIndicator(
                value: ratio, // Adjusted ratio
                valueColor:
                    AlwaysStoppedAnimation(progressColor), // Dynamic color
                backgroundColor: AppColors.secondaryColor,
                borderColor: progressColor,
                borderWidth: 2.0,
                borderRadius: 12.0,
                direction: Axis.horizontal,
                center: Text(
                  progressText,
                  style: AppTextStyles.poppins16Bold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
