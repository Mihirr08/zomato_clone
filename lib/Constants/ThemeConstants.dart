import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zomato_ui/Constants/SizeConstants.dart';

class ThemeConstant {
  static ThemeData primaryTheme = ThemeData(
      primaryColor: Colors.red,
      fontFamily: GoogleFonts.comicNeue(
        fontSize: SizeConstants.defaultFontSize,
      ).fontFamily,
      primaryIconTheme: const IconThemeData(color: Colors.red),
      primarySwatch: Colors.red,
      splashColor: Colors.red.withOpacity(0.3),
      scaffoldBackgroundColor: const Color(0xffF7EFEE));

  static ThemeData secondTheme = ThemeData(
      primaryColor: Colors.purple,
      fontFamily: GoogleFonts.comicNeue(
        fontSize: SizeConstants.defaultFontSize,
      ).fontFamily,
      primaryIconTheme: const IconThemeData(color: Colors.purple),
      primarySwatch: Colors.purple,
      splashColor: Colors.purple.withOpacity(0.3),
      scaffoldBackgroundColor: const Color(0xffF7EFEE));

  ThemeData getThemeByNumber(int number) {
    switch (number) {
      case 0:
        return primaryTheme;
      case 1:
        return secondTheme;
      default:
        return primaryTheme;
    }
  }
}
