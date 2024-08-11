import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final TextTheme customTextTheme = GoogleFonts.gupterTextTheme(
  ThemeData.light().textTheme,
).copyWith(
  displayLarge: GoogleFonts.oswald(
    textStyle: const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
  bodyLarge: GoogleFonts.roboto(
    textStyle: const TextStyle(fontSize: 16.0),
  ),
);
