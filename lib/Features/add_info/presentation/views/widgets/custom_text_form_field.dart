import 'package:balanced_meal/core/styles/colors.dart';
import 'package:balanced_meal/core/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/styles/fonts_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final String suffixText;
  final Function(String) onChanged;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.suffixText,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      validator: (value) => AppValidator.validateEmpty(hintText, value),
      style: AppTextStyles.poppins16Bold,
      keyboardType: TextInputType.number, // Numeric keyboard
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        errorStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        hintStyle: AppTextStyles.questrial16,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            widthFactor: 1,
            alignment: Alignment.centerRight,
            child: Text(
              suffixText,
              style: AppTextStyles.poppins14,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
