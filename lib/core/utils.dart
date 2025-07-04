import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import '../models/imc_result.dart';
import 'constants.dart';

// Funções utilitárias e validações
class Validators {
  static String? validatePeso(String? value) {
    if (value == null || value.isEmpty) return tr(AppStrings.weightRequired);
    final peso = double.tryParse(value.replaceAll(',', '.'));
    if (peso == null || peso <= 0) return tr(AppStrings.weightInvalid);
    if (peso < AppLimits.minWeight || peso > AppLimits.maxWeight) {
      return tr(AppStrings.weightRangeError, namedArgs: {
        'min': AppLimits.minWeight.toString(),
        'max': AppLimits.maxWeight.toString(),
      });
    }
    return null;
  }

  static String? validateAltura(String? value) {
    if (value == null || value.isEmpty) return tr(AppStrings.heightRequired);
    final altura = double.tryParse(value.replaceAll(',', '.'));
    if (altura == null || altura <= 0) return tr(AppStrings.heightInvalid);
    if (altura < AppLimits.minHeight || altura > AppLimits.maxHeight) {
      return tr(AppStrings.heightRange);
    }
    return null;
  }

  static String? validateIdade(String? value) {
    if (value == null || value.isEmpty) return tr(AppStrings.ageRequired);
    final idade = int.tryParse(value);
    if (idade == null || idade <= 0) return tr(AppStrings.ageInvalid);
    if (idade < AppLimits.minAge || idade > AppLimits.maxAge) {
      return tr(AppStrings.ageRangeError, namedArgs: {
        'min': AppLimits.minAge.toString(),
        'max': AppLimits.maxAge.toString(),
      });
    }
    return null;
  }
}

// Função para calcular IMC
ImcResult calculateImc(double weight, double heightCm) {
  final height = heightCm / 100;
  final imc = weight / (height * height);
  String category = _getCategory(imc);
  
  return ImcResult(imc, category);
}

String _getCategory(double imc) {
  if (imc < AppLimits.imcUnderweight) return 'categoryUnderweight';
  if (imc < AppLimits.imcNormal) return 'categoryNormal';
  if (imc < AppLimits.imcOverweight) return 'categoryOverweight';
  if (imc < AppLimits.imcObese) return 'categoryObese';
  return 'categorySevereObese';
}

String encodeHistory(List<ImcResult> history) =>
    jsonEncode(history.map((e) => e.toMap()).toList());

List<ImcResult> decodeHistory(String raw) {
  final decoded = jsonDecode(raw) as List;
  return decoded.map((e) => ImcResult.fromMap(e)).toList();
}

// Extensão para formatação de números
extension NumberFormatting on double {
  String toFormattedString([int decimalPlaces = 2]) {
    return toStringAsFixed(decimalPlaces);
  }
}

// Extensão para strings
extension StringExtensions on String {
  String replacePlaceholder(String placeholder, String value) {
    return replaceAll('{$placeholder}', value);
  }
} 