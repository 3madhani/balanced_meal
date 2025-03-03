import 'package:balanced_meal/Features/add_info/presentation/view_model/add_info_view_model.dart';
import 'package:balanced_meal/core/styles/colors.dart';
import 'package:balanced_meal/core/styles/fonts_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DropdownMenuWidget extends StatelessWidget {
  const DropdownMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddInfoViewModel>(
      builder: (context, viewModel, child) {
        // The flag to track if the "Next" button has been pressed
        bool isButtonPressed = viewModel.isButtonPressed;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEAECF0)),
                color: viewModel.selectedGender != null
                    ? const Color(0xFFFFF3E0)
                    : AppColors.appbarColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 24.0),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(8),
                  itemHeight: 60,
                  underline: const SizedBox(),
                  dropdownColor: AppColors.scaffoldColor,
                  isExpanded: true,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: const Icon(
                      FontAwesomeIcons.chevronDown,
                      size: 20,
                    ),
                  ),
                  value: viewModel.selectedGender,
                  hint: Text(
                    "Choose your gender",
                    style: AppTextStyles.questrial16,
                  ),
                  items: viewModel.genders.map((String value) {
                    bool isSelected = viewModel.selectedGender == value;
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(
                                  0xFFFFF3E0) // Light orange background
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value, style: AppTextStyles.poppins16Bold),
                            if (isSelected)
                              const Icon(
                                Icons.check,
                                color: Color(0xFFFF9800), // Orange checkmark
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      viewModel.setSelectedGender(newValue);
                    }
                  },
                ),
              ),
            ),
            // Display warning if gender is still null and button has been pressed
            if (isButtonPressed && viewModel.selectedGender == null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Please select your gender",
                  style: TextStyle(
                    color: Colors.red, // Red color for warning
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
