import 'package:balanced_meal/Features/welcome/presentation/welcome_screen.dart';
import 'package:balanced_meal/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Features/add_info/presentation/views/add_info_screen.dart';
import 'Features/food_order/presentation/view_model/order_meal_view_model.dart';
import 'Features/food_order/presentation/views/food_order.dart';
import 'Features/food_order/presentation/views/order_summary.dart';

void main() {
  runApp(const BalancedMealApp());
}

class BalancedMealApp extends StatelessWidget {
  const BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderMealViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins', // Set Poppins as the default font
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.scaffoldColor,
        ),
        home: WelcomeScreen(),
        routes: {
          AddInfoScreen.routeName: (context) => AddInfoScreen(),
          FoodOrderScreen.routeName: (context) => FoodOrderScreen(),
          OrderSummary.routeName: (context) => OrderSummary(),
        },
      ),
    );
  }
}
