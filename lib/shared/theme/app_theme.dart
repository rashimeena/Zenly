import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme => _buildTheme(
      brightness: Brightness.light,
      backgroundColor: AppColors.background,
      surfaceColor: AppColors.surface,
      primaryColor: AppColors.primary,
      secondaryColor: AppColors.secondary,
      accentColor: AppColors.tertiary,
      textPrimary: AppColors.textPrimary,
      textSecondary: AppColors.textSecondary,
    );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color backgroundColor,
    required Color surfaceColor,
    required Color primaryColor,
    required Color secondaryColor,
    required Color accentColor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      // 📝 Use GoogleFonts for the default theme
      textTheme: GoogleFonts.interTextTheme(
        TextTheme(
          displayLarge: GoogleFonts.manrope(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            color: textPrimary,
            letterSpacing: -1.5,
          ),
          headlineLarge: GoogleFonts.manrope(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            color: textPrimary,
            letterSpacing: -1.0,
          ),
          headlineMedium: GoogleFonts.manrope(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textPrimary,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            color: textSecondary,
            height: 1.5,
          ),
          bodyMedium: GoogleFonts.inter(fontSize: 14, color: textSecondary),
          labelSmall: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
            color: textSecondary,
          ),
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,

      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: secondaryColor,
        onSecondary: Colors.white,
        surface: surfaceColor,
        onSurface: textPrimary,
        surfaceContainerHighest: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondaryContainer: AppColors.secondaryContainer,
        error: AppColors.error,
        onError: Colors.white,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        foregroundColor: textPrimary,
      ),

      cardTheme: CardThemeData(
        color: AppColors.surfaceContainerHigh,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          textStyle: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceContainerHigh,
        selectedColor: AppColors.primary,
        disabledColor: Colors.transparent,
        secondarySelectedColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: textPrimary,
        ),
        secondaryLabelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
          //borderSide: BorderSide.none,
        ),
        showCheckmark: false,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceContainerHigh.withValues(alpha: 0.8),
        hintStyle: GoogleFonts.inter(color: textSecondary, fontSize: 16),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        prefixIconColor: textSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),

      dividerColor: AppColors.border,
    );
  }
}
