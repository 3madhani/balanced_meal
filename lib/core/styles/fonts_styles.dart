import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTextStyles {
  // Poppins (Primary Font)
  static const TextStyle poppins20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Color(0xFFDADADA),
  );

  static const TextStyle poppins20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1E1E1E),
  );

  static const TextStyle poppins16Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1E1E1E),
  );

  static const TextStyle poppins16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1E1E1E),
  );

  static const TextStyle poppins14Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Color(0xFF474747),
  );

  static const TextStyle poppins14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF959595),
  );

  // AbhayaLibre
  static const TextStyle abhayaExtraBold = TextStyle(
    fontFamily: AppFonts.abhayaLibre,
    fontSize: 48,
    color: Colors.white,
    fontWeight: FontWeight.w800, // Equivalent to ExtraBold
  );

  // Questrial
  static const TextStyle questrial16 = TextStyle(
    fontFamily: AppFonts.questrial,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF959595),
  );
}
