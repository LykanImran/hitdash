import 'package:flutter/material.dart';

class AppStyle {
  // Color Palette
  static const Color primaryColor = Color(0xFF3A86FF);
  static const Color secondaryColor = Color(0xFF8338EC);
  static const Color accentColor = Color(0xFFFF006E);

  // Minimalist White/Greyish Background Scheme
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFFF0F0F0);
  static const Color surface = Colors.white;
  static const Color dividerColor = Color(0xFFE0E0E0);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Colors.white;

  // Shadows
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 6,
      offset: const Offset(0, 2),
    )
  ];

  // Borders
  static BorderRadius borderRadius = BorderRadius.circular(12);
  static BorderRadius buttonRadius = BorderRadius.circular(8);
  static const BorderSide borderSide = BorderSide(
    color: dividerColor,
    width: 1,
  );

  // Padding
  static const EdgeInsets screenPadding = EdgeInsets.all(16);
  static const EdgeInsets cardPadding = EdgeInsets.all(16);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 16,
  );

  // Text Styles
  static TextStyle headlineLarge = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle headlineMedium = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static TextStyle titleLarge = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textPrimary,
  );

  static TextStyle bodySmall = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textOnPrimary,
  );

  // Theme Data
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: surface,
          background: backgroundLight,
          onPrimary: textOnPrimary,
        ),
        scaffoldBackgroundColor: backgroundLight,
        cardTheme: CardTheme(
          color: surface,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: borderSide,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: surface,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: headlineMedium.copyWith(color: textPrimary),
          iconTheme: const IconThemeData(color: textPrimary),
        ),
        dividerTheme: const DividerThemeData(
          color: dividerColor,
          space: 1,
          thickness: 1,
        ),
      );

  // Custom Widget Styles
  static BoxDecoration cardDecoration = BoxDecoration(
    color: surface,
    borderRadius: borderRadius,
    border: Border.all(
      color: dividerColor,
      width: 1,
    ),
    boxShadow: cardShadow,
  );

  static ButtonStyle primaryButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(primaryColor),
    foregroundColor: MaterialStateProperty.all(textOnPrimary),
    padding: MaterialStateProperty.all(buttonPadding),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: buttonRadius),
    ),
    elevation: MaterialStateProperty.all(0),
    textStyle: MaterialStateProperty.all(buttonText),
  );

  static ButtonStyle secondaryButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    foregroundColor: MaterialStateProperty.all(primaryColor),
    padding: MaterialStateProperty.all(buttonPadding),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: buttonRadius,
        side: const BorderSide(color: primaryColor),
      ),
    ),
    elevation: MaterialStateProperty.all(0),
    textStyle:
        MaterialStateProperty.all(buttonText.copyWith(color: primaryColor)),
  );
}
