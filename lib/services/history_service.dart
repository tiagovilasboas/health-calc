import 'package:shared_preferences/shared_preferences.dart';
import '../models/imc_result.dart';
import '../core/utils.dart';

/// Serviço responsável por gerenciar o histórico de IMC
/// Segue o princípio SRP - única responsabilidade: persistência de dados
class HistoryService {
  static const String _storageKey = 'history';

  /// Carrega o histórico salvo
  Future<List<ImcResult>> loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_storageKey) ?? '[]';
      return decodeHistory(raw);
    } catch (e) {
      // Em caso de erro, retorna lista vazia
      return [];
    }
  }

  /// Salva um novo resultado no histórico
  Future<void> saveResult(ImcResult result) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_storageKey) ?? '[]';
      final history = decodeHistory(raw);
      history.add(result);
      await prefs.setString(_storageKey, encodeHistory(history));
    } catch (e) {
      // Log do erro (em produção, usar um logger)
      print('Erro ao salvar resultado: $e');
    }
  }

  /// Limpa todo o histórico
  Future<void> clearHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
    } catch (e) {
      print('Erro ao limpar histórico: $e');
    }
  }

  /// Retorna o histórico em ordem cronológica reversa (mais recente primeiro)
  Future<List<ImcResult>> getHistoryReversed() async {
    final history = await loadHistory();
    return history.reversed.toList();
  }

  /// Retorna estatísticas do histórico
  Future<HistoryStats> getStats() async {
    final history = await loadHistory();
    if (history.isEmpty) {
      return HistoryStats.empty();
    }

    final values = history.map((e) => e.value).toList();
    final categories = history.map((e) => e.category).toList();

    return HistoryStats(
      totalEntries: history.length,
      averageImc: values.reduce((a, b) => a + b) / values.length,
      highestImc: values.reduce((a, b) => a > b ? a : b),
      lowestImc: values.reduce((a, b) => a < b ? a : b),
      mostCommonCategory: _getMostCommon(categories),
    );
  }

  String _getMostCommon(List<String> list) {
    final frequency = <String, int>{};
    for (final item in list) {
      frequency[item] = (frequency[item] ?? 0) + 1;
    }
    return frequency.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }
}

/// Classe para estatísticas do histórico
class HistoryStats {
  final int totalEntries;
  final double averageImc;
  final double highestImc;
  final double lowestImc;
  final String mostCommonCategory;

  const HistoryStats({
    required this.totalEntries,
    required this.averageImc,
    required this.highestImc,
    required this.lowestImc,
    required this.mostCommonCategory,
  });

  factory HistoryStats.empty() {
    return const HistoryStats(
      totalEntries: 0,
      averageImc: 0,
      highestImc: 0,
      lowestImc: 0,
      mostCommonCategory: '',
    );
  }
} 