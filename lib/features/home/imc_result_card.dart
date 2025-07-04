import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../models/imc_result.dart';
import '../../core/constants.dart';
import '../../core/utils.dart';

class ImcResultCard extends StatelessWidget {
  final ImcResult result;

  const ImcResultCard({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final categoryColor = _getCategoryColor(result.category);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getCategoryIcon(result.category), color: categoryColor, size: 24),
            SizedBox(width: AppSizes.paddingSmall),
            Text(
              _getCategoryText(result.category),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: categoryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.paddingLarge),
        Text(
          result.value.toStringAsFixed(1),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: categoryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSizes.paddingSmall),
        Text(
          tr('imc_result', namedArgs: {'value': result.value.toStringAsFixed(1)}),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSizes.paddingLarge),
        SizedBox(height: AppSizes.paddingLarge),
        Text(
          result.formattedDate,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }



  Color _getCategoryColor(String category) {
    switch (category) {
      case 'categoryUnderweight':
        return AppColors.warning;
      case 'categoryNormal':
        return AppColors.success;
      case 'categoryOverweight':
        return AppColors.warning;
      case 'categoryObese':
        return AppColors.error;
      case 'categorySevereObese':
        return AppColors.error;
      default:
        return AppColors.primary;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'categoryUnderweight':
        return Icons.trending_down;
      case 'categoryNormal':
        return Icons.check_circle;
      case 'categoryOverweight':
        return Icons.trending_up;
      case 'categoryObese':
        return Icons.warning;
      case 'categorySevereObese':
        return Icons.error;
      default:
        return Icons.help;
    }
  }

  String _getCategoryText(String category) => tr(category);
} 