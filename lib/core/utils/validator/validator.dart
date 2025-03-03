class AppValidator {
  static String? validateEmpty(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName';
    }

    return null;
  }
}
