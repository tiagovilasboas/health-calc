import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/constants.dart';
import '../../models/imc_result.dart';

class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String> onGenderChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('gender_label'),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSizes.paddingSmall),
        Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                title: Text(
                  tr('male'),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                value: 'male',
                groupValue: selectedGender,
                onChanged: (value) => onGenderChanged(value!),
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.primary,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: Text(
                  tr('female'),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                value: 'female',
                groupValue: selectedGender,
                onChanged: (value) => onGenderChanged(value!),
                contentPadding: EdgeInsets.zero,
                activeColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
} 