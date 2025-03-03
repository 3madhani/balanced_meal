import 'package:flutter/material.dart';

import '../../../../core/utils/helper/health_helper.dart';

class AddInfoViewModel extends ChangeNotifier {
  String? selectedGender;
  String? weight;
  String? height;
  String? age;

  bool isButtonPressed = false; // To track if the button is pressed

  // Gender options
  final List<String> genders = ["Male", "Female"];

  // Check if all fields are filled (gender, weight, height, age)
  bool areAllFieldsValid() {
    return selectedGender != null &&
        weight != null &&
        height != null &&
        age != null;
  }

  double calculateCalories() {
    return HealthHelper.calculateCalories(
        gender: selectedGender!,
        weight: double.parse(weight!),
        height: double.parse(height!),
        age: int.parse(age!));
  }

  // Method to set button pressed state (triggered when the "Next" button is pressed)
  void onNextButtonPressed() {
    isButtonPressed = true;
    notifyListeners();
  }

  void setAge(String ageValue) {
    age = ageValue;
    notifyListeners();
  }

  void setHeight(String heightValue) {
    height = heightValue;
    notifyListeners();
  }

  void setSelectedGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void setWeight(String weightValue) {
    weight = weightValue;
    notifyListeners();
  }
}
