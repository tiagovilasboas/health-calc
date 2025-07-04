// Constantes de strings, cores e estilos fixos
import 'package:flutter/material.dart';

class AppColors {
  // Paleta principal moderna
  static const primary = Color(0xFF2563EB); // Azul principal
  static const secondary = Color(0xFF60A5FA); // Azul claro
  static const background = Color(0xFFF9FAFB); // Branco quase puro
  static const cardBackground = Colors.white;
  static const border = Color(0xFFE5E7EB); // Cinza claro
  static const shadow = Color(0x1A000000); // Sombra leve
  static const textPrimary = Color(0xFF1F2937); // Cinza escuro
  static const textSecondary = Color(0xFF6B7280); // Cinza médio
  static const error = Color(0xFFEF4444); // Vermelho
  static const success = Color(0xFF10B981); // Verde
  static const warning = Color(0xFFF59E0B); // Amarelo
  
  // Gradientes modernos
  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const secondaryGradient = LinearGradient(
    colors: [Color(0xFF06B6D4), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradientes complexos (3+ cores)
  static const rainbowGradient = LinearGradient(
    colors: [
      Color(0xFF6366F1), // Indigo
      Color(0xFF8B5CF6), // Violet
      Color(0xFFEC4899), // Pink
      Color(0xFFF59E0B), // Amber
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const healthGradient = LinearGradient(
    colors: [
      Color(0xFF10B981), // Emerald
      Color(0xFF06B6D4), // Cyan
      Color(0xFF3B82F6), // Blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Cores de status com variações
  static const successLight = Color(0xFF34D399);
  static const successDark = Color(0xFF059669);
  
  static const warningLight = Color(0xFFFBBF24);
  static const warningDark = Color(0xFFD97706);
  
  static const errorLight = Color(0xFFF87171);
  static const errorDark = Color(0xFFDC2626);
  
  static const info = Color(0xFF3B82F6); // Blue
  static const infoLight = Color(0xFF60A5FA);
  static const infoDark = Color(0xFF2563EB);
  
  // Cores neutras
  static const darkBackground = Color(0xFF0F0F23);
  static const darkCardBackground = Color(0xFF1A1A2E);
  
  // Cores para glassmorphism
  static const glassBackground = Color(0x80FFFFFF);
  static const glassBorder = Color(0x40FFFFFF);
  static const darkGlassBackground = Color(0x801A1A2E);
  static const darkGlassBorder = Color(0x40FFFFFF);
}

class AppStrings {
  // App
  static const appName = 'app_name';
  static const appVersion = '1.0.0';
  
  // Navigation
  static const homeTitle = 'home_title';
  static const historyTitle = 'history_title';
  
  // Form
  static const weightLabel = 'weight_label';
  static const heightLabel = 'height_label';
  static const genderLabel = 'gender_label';
  static const ageLabel = 'age_label';
  static const calculateButton = 'calculate_button';
  
  // Gender options
  static const male = 'male';
  static const female = 'female';
  static const other = 'other';
  
  // Validation
  static const weightRequired = 'weight_required';
  static const weightInvalid = 'weight_invalid';
  static const heightRequired = 'height_required';
  static const heightInvalid = 'height_invalid';
  static const heightRange = 'height_range';
  static const genderRequired = 'gender_required';
  static const ageRequired = 'age_required';
  static const ageInvalid = 'age_invalid';
  
  // Results
  static const imcResult = 'imc_result';
  static const noHistory = 'no_history';
  static const clearHistory = 'clear_history';
  static const statsTitle = 'stats_title';
  
  // Categories
  static const categoryUnderweight = 'categoryUnderweight';
  static const categoryNormal = 'categoryNormal';
  static const categoryOverweight = 'categoryOverweight';
  static const categoryObese = 'categoryObese';
  static const categorySevereObese = 'categorySevereObese';
  
  // Stats
  static const totalLabel = 'total_label';
  static const averageLabel = 'average_label';
  static const highestLabel = 'highest_label';
  static const lowestLabel = 'lowest_label';
  
  // Validation errors
  static const weightRangeError = 'weight_range_error';
  static const ageRangeError = 'age_range_error';
  
  // Additional labels
  static const tmbLabel = 'tmb_label';
  static const bodyFatLabel = 'body_fat_label';
  static const bmiLabel = 'bmi_label';
}

class AppSizes {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
  
  static const double chartHeight = 200.0;
  static const double cardElevation = 4.0;
  
  // Novos tamanhos para glassmorphism
  static const double glassBlur = 10.0;
  static const double glassOpacity = 0.8;
}

class AppLimits {
  static const double minWeight = 20.0;
  static const double maxWeight = 300.0;
  static const double minHeight = 50.0;
  static const double maxHeight = 300.0;
  static const int minAge = 1;
  static const int maxAge = 120;
  
  static const double imcUnderweight = 18.5;
  static const double imcNormal = 24.9;
  static const double imcOverweight = 29.9;
  static const double imcObese = 39.9;
}

// Extensões para animações
class AppAnimations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve bounce = Curves.bounceOut;
  static const Curve elastic = Curves.elasticOut;
} 