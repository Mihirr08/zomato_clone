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
}
