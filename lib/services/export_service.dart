import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';
import '../models/imc_result.dart';

class ExportService {
  static Future<File> exportHistoryToCSV(List<ImcResult> history) async {
    try {
      // Cabeçalhos com tradução
      final headers = [
        tr('bmi_label'),
        tr('category'),
        'Data',
      ];

      // Dados formatados
      final rows = history.map((result) => [
        result.value.toStringAsFixed(2),
        tr(result.category), // Traduz a categoria
        result.formattedDate,
      ]).toList();

      // Converter para CSV
      final csv = const ListToCsvConverter().convert([headers, ...rows]);

      // Salvar arquivo
      final dir = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final file = File('${dir.path}/imc_history_$timestamp.csv');
      
      await file.writeAsString(csv);
      return file;
    } catch (e) {
      throw Exception('Erro ao exportar CSV: $e');
    }
  }

  static Future<String> getExportPath() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
} 