import 'package:balanced_meal/core/constants/json.dart';
import 'package:balanced_meal/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/styles/fonts_styles.dart';
import '../../data/models/meal_model/meal_model.dart';
import '../view_model/order_meal_view_model.dart';
import 'widgets/box_of_button.dart';
import 'widgets/meal_list.dart';

class FoodOrderScreen extends StatelessWidget {
  static const String routeName = "/food_order_screen";

  const FoodOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MealModel> carbsList =
        carbs.map((item) => MealModel.fromMap(item)).toList();
    List<MealModel> meatList =
        meat.map((item) => MealModel.fromMap(item)).toList();
    List<MealModel> vegetablesList =
        vegetables.map((item) => MealModel.fromMap(item)).toList();
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final calories = arguments["calories"];
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          "Create your order",
          style: AppTextStyles.poppins20Bold,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: AppSizes.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      "Vegetables",
                      style: AppTextStyles.poppins20Bold,
                    ),
                    const SizedBox(height: 8),
                    MealList(
                      mealModel: vegetablesList,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Meats",
                      style: AppTextStyles.poppins20Bold,
                    ),
                    const SizedBox(height: 8),
                    MealList(
                      mealModel: meatList,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Carbs",
                      style: AppTextStyles.poppins20Bold,
                    ),
                    const SizedBox(height: 8),
                    MealList(
                      mealModel: carbsList,
                    )
                  ],
                ),
              ),
            ),
          ),
          Consumer<OrderMealViewModel>(
            builder: (context, viewModel, child) {
              Future.microtask(() => viewModel.setDailyCaloricNeed(calories));
              return BoxOfButton(
                price: viewModel.totalSalary.toInt(),
                sumOfCalories: viewModel.totalCalories,
                numOfCaloriesNeeded: calories,
              );
            },
          ),
        ],
      ),
    );
  }
}
