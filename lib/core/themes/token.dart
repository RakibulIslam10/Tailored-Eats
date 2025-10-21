import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model.dart';
part 'custom_colors.dart';

part 'themes.dart';

// LIGHT THEME DATA - - - - - - - - - - - - - - - - -

final ThemeData lightThemeData = ThemeData.light().copyWith(
  primaryColor: CustomColors.primary,
  dividerColor: Colors.transparent,
  colorScheme: ColorScheme.light(tertiary: CustomColors.tertiary),
  scaffoldBackgroundColor: CustomColors.blackColor,
  appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
  textTheme: GoogleFonts.openSansTextTheme(),

  // textTheme: ThemeData.light().textTheme.apply(
  //   // fontFamily: GoogleFonts.montserrat().fontFamily,
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: CustomColors.primary,
      side: BorderSide(color: CustomColors.primary),
    ),
  ),
);

// DARK THEME DATA - - - - - - - - - - - - - - - - -

final ThemeData darkThemeData = ThemeData.dark().copyWith(
  primaryColor: CustomColors.primaryDark,
  colorScheme: ColorScheme.dark(surface: CustomColors.tertiaryDark),
  scaffoldBackgroundColor: CustomColors.backgroundDark,
  brightness: Brightness.dark,
  textTheme: GoogleFonts.openSansTextTheme(),

  // textTheme: ThemeData.dark().textTheme.apply(
  //   // fontFamily: GoogleFonts.inter().fontFamily,
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: CustomColors.primary,
      side: BorderSide(color: CustomColors.primary),
    ),
  ),
);

