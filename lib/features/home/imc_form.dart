import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../models/imc_result.dart';
import '../../core/utils.dart';
import '../../core/constants.dart';
import '../../services/history_service.dart';
import '../../shared/widgets/custom_input.dart';
import '../../shared/widgets/custom_button.dart';
import 'imc_result_card.dart';

class ImcForm extends StatefulWidget {
  @override
  State<ImcForm> createState() => _ImcFormState();
}

class _ImcFormState extends State<ImcForm> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _historyService = HistoryService();

  ImcResult? _result;
  bool _isCalculating = false;

  void _calculate() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isCalculating = true);
      try {
        final weight = double.parse(_weightController.text);
        final height = double.parse(_heightController.text);
        final result = calculateImc(weight, height);
        await _historyService.saveResult(result);
        setState(() {
          _result = result;
          _isCalculating = false;
        });
      } catch (e) {
        setState(() => _isCalculating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Card(
              elevation: AppSizes.cardElevation,
              margin: const EdgeInsets.all(AppSizes.paddingLarge),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
                side: BorderSide(color: AppColors.border),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.paddingXLarge),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        tr('home_title'),
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSizes.paddingLarge),
                      CustomInput(
                        hint: tr('weight_label'),
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: AppSizes.paddingMedium),
                      CustomInput(
                        hint: tr('height_label'),
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: AppSizes.paddingLarge),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          label: tr('calculate_button'),
                          onPressed: _calculate,
                          isLoading: _isCalculating,
                        ),
                      ),
                      if (_result != null) ...[
                        SizedBox(height: AppSizes.paddingXLarge),
                        Divider(),
                        SizedBox(height: AppSizes.paddingLarge),
                        ImcResultCard(result: _result!),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 