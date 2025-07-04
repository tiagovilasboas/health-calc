import 'package:flutter/material.dart';

enum Gender { male, female, other }

// Modelo simplificado para resultado do IMC
class ImcResult {
  final double value;
  final String category;
  final DateTime date;

  ImcResult(this.value, this.category, [DateTime? date])
      : date = date ?? DateTime.now();

  Map<String, dynamic> toMap() => {
        'value': value,
        'category': category,
        'date': date.toIso8601String(),
      };

  factory ImcResult.fromMap(Map<String, dynamic> map) =>
      ImcResult(map['value'], map['category'], DateTime.parse(map['date']));

  // Getter para cor baseada na categoria
  Color get categoryColor {
    switch (category) {
      case 'categoryUnderweight':
        return Colors.orange;
      case 'categoryNormal':
        return Colors.green;
      case 'categoryOverweight':
        return Colors.orange;
      case 'categoryObese':
      case 'categorySevereObese':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  String get formattedDate {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
} 