import 'package:balanced_meal/Features/add_info/presentation/views/widgets/drop_down_menu_widget.dart';
import 'package:balanced_meal/core/styles/fonts_styles.dart';
import 'package:balanced_meal/core/widgets/primary_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../food_order/presentation/views/food_order.dart';
import '../view_model/add_info_view_model.dart';
import 'widgets/custom_text_form_field.dart';

class AddInfoScreen extends StatelessWidget {
  static const String routeName = '/add_info';

  const AddInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (_) => AddInfoViewModel(),
      child: Scaffold(
        appBar: CustomAppbar(
          showBackArrow: true,
          title: Text(
            "Enter your Details",
            style: AppTextStyles.poppins20Bold,
          ),
        ),
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
          child: Form(
            key: formKey,
            child: Consumer<AddInfoViewModel>(
                builder: (context, viewModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text("Gender", style: AppTextStyles.poppins14),
                      const SizedBox(height: 10),
                      DropdownMenuWidget(),
                      const SizedBox(height: 30),
                      Text("Weight", style: AppTextStyles.poppins14),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        // Only updates value in the view model, no form validation here
                        onChanged: (value) => viewModel.setWeight(value),
                        controller:
                            TextEditingController(text: viewModel.weight),
                        hintText: "Enter your weight",
                        suffixText: "Kg",
                      ),
                      const SizedBox(height: 30),
                      Text("Height", style: AppTextStyles.poppins14),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        // Only updates value in the view model, no form validation here
                        onChanged: (value) => viewModel.setHeight(value),
                        controller:
                            TextEditingController(text: viewModel.height),
                        hintText: "Enter your height",
                        suffixText: "Cm",
                      ),
                      const SizedBox(height: 30),
                      Text("Age", style: AppTextStyles.poppins14),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        // Only updates value in the view model, no form validation here
                        onChanged: (value) => viewModel.setAge(value),
                        controller: TextEditingController(text: viewModel.age),
                        hintText: "Enter your age",
                        suffixText: "",
                      ),
                    ],
                  ),
                  const SizedBox(height: 240),
                  Consumer<AddInfoViewModel>(
                    builder: (context, viewModel, child) {
                      return PrimaryButtons(
                        text: "Next",
                        onPressed: () {
                          // Trigger validation only when the user presses "Next"
                          viewModel.onNextButtonPressed();
                          if (formKey.currentState!.validate() &&
                              viewModel.areAllFieldsValid()) {
                            viewModel.calculateCalories();

                            // If the form is valid, navigate to the next screen
                            Navigator.of(context).pushNamed(
                              FoodOrderScreen.routeName,
                              arguments: {
                                'calories': viewModel.calculateCalories()
                              },
                            );
                          }
                        },
                        color: viewModel.areAllFieldsValid()
                            ? AppColors.primaryColor
                            : const Color(0xFFEAECF0),
                        textColor: viewModel.areAllFieldsValid()
                            ? Colors.white
                            : const Color(0xFF959595),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
