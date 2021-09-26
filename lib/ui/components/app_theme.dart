import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppTheme {
  static const _lightFillColor = Color(0xFF303030);

  static final Color _lightFocusColor = _lightFillColor.withOpacity(0.0);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      canvasColor: colorScheme.background,
      backgroundColor: colorScheme.background,
      colorScheme: colorScheme,
      disabledColor: colorScheme.onBackground.withAlpha(40),
      dividerColor: colorScheme.onBackground.withAlpha(40),
      errorColor: colorScheme.error,
      focusColor: focusColor,
      highlightColor: Colors.transparent,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      primaryColor: colorScheme.primary,
      primaryColorLight: colorScheme.primaryVariant,
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: _textTheme,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    background: Color(0xFF262626),
    brightness: Brightness.light,
    error: Color(0xFFD83838),
    onBackground: Color(0xFFFFFFFF),
    onError: Color(0xFFFCFCFC),
    onPrimary: Color(0xFFFCFCFC),
    onSecondary: Color(0xFFFCFCFC),
    onSurface: Color(0xFF303030),
    primary: Color(0xFFFFFFFF),
    primaryVariant: Color(0xFF63B476),
    secondary: Color(0xFF367E9B),
    secondaryVariant: Color(0xFF6AADCC),
    surface: Color(0xFFFFFFFF),
  );

  static const _light = FontWeight.w300;
  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.lato(
      fontSize: 93,
      fontWeight: _light,
      letterSpacing: -1.5,
      color: const Color(0xFFFFFFFF),
    ),
    headline2: GoogleFonts.lato(
      fontSize: 58,
      fontWeight: _light,
      letterSpacing: -0.5,
      color: const Color(0xFFFFFFFF),
    ),
    headline3: GoogleFonts.lato(
      fontSize: 24,
      fontWeight: _regular,
      color: const Color(0xFFFFFFFF),
    ),
    headline4: GoogleFonts.lato(
      fontSize: 20,
      fontWeight: _light,
      color: const Color(0xFFFFFFFF),
    ),
    headline5: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: _regular,
      color: const Color(0xFF707070),
    ),
    subtitle1: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: _regular,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: _medium,
      letterSpacing: 0.1,
    ),
    bodyText1: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: _regular,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: _regular,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: _medium,
      letterSpacing: 1.25,
      color: const Color(0xFFC68D29),
    ),
    caption: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: _regular,
      letterSpacing: 0.4,
    ),
    overline: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: _regular,
      letterSpacing: 1.5,
    ),
  );
}
