import 'package:balanced_meal/Features/food_order/presentation/views/widgets/order_card.dart';
import 'package:balanced_meal/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/fonts_styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/primary_buttons.dart';
import '../view_model/order_meal_view_model.dart';

class OrderSummary extends StatelessWidget {
  static const String routeName = "/order_summary";

  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(
          "Create your order",
          style: AppTextStyles.poppins20Bold,
        ),
      ),
      body: Consumer<OrderMealViewModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: value.orderMealList.length,
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: AppSizes.defaultPadding),
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      meal: value.orderMealList.keys.toList()[index],
                      quantity: value.orderMealList.values.toList()[index],
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppSizes.defaultPadding,
                      right: AppSizes.defaultPadding,
                      bottom: AppSizes.defaultPadding,
                      top: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cal", style: AppTextStyles.poppins16),
                          Row(
                            children: [
                              Text(
                                "${value.totalCalories.toInt()}",
                                style: AppTextStyles.poppins14.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(" Cal out of ",
                                  style: AppTextStyles.poppins14),
                              Text(
                                "${value.dailyCaloricNeed.toInt()}",
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
                            "\$ ${value.totalSalary.toInt()}",
                            style: AppTextStyles.poppins16Bold.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      PrimaryButtons(
                        text: "Place Order",
                        onPressed: () {
                          showSuccessMessage(context); // Show floating message
                        },
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showSuccessMessage(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.width * 0.5, // Adjust position
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: 260,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                    width: 200,
                    height: 200,
                    "assets/images/successfully-done.json"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Order placed successfully!",
                      style: AppTextStyles.abhayaExtraBold.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto-dismiss after 2 seconds
    Future.delayed(Duration(seconds: 4), () {
      overlayEntry.remove();
    });
  }
}
