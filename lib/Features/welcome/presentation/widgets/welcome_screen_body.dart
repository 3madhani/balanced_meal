import 'package:balanced_meal/Features/add_info/presentation/views/add_info_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/const_strings.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/fonts_styles.dart';
import '../../../../core/widgets/primary_buttons.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ConstStrings.welcomeImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 48,
          ),
          Text(
            ConstStrings.appName,
            style: AppTextStyles.abhayaExtraBold,
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            textAlign: TextAlign.center,
            ConstStrings.appDescription,
            style: AppTextStyles.poppins20,
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButtons(
              text: "Order Food",
              onPressed: () =>
                  Navigator.pushNamed(context, AddInfoScreen.routeName),
              color: AppColors.primaryColor,
              textColor: Colors.white),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
