import 'package:balanced_meal/core/constants/app_sizes.dart';
import 'package:balanced_meal/core/styles/colors.dart';
import 'package:balanced_meal/core/styles/fonts_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButtons extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  final Color color;

  final Color textColor;

  final double borderRadius;
  const PrimaryButtons({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    required this.textColor,
    this.borderRadius = AppSizes.primaryButtonBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          overlayColor: AppColors.primaryColor,
          backgroundColor: color,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.primaryButtonPaddingHorizontal,
            vertical: AppSizes.primaryButtonPaddingVertical,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.poppins16.copyWith(color: textColor),
        ),
      ),
    );
  }
}
