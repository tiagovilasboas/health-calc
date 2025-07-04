import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../models/imc_result.dart';
import '../../core/constants.dart';
import '../../core/utils.dart';
import '../../services/history_service.dart';
import '../../services/export_service.dart';
import '../../shared/widgets/custom_button.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _historyService = HistoryService();
  List<dynamic> _history = [];
  bool _isLoading = true;
  HistoryStats? _stats;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    setState(() => _isLoading = true);
    try {
      final history = await _historyService.getHistoryReversed();
      final stats = await _historyService.getStats();
      setState(() {
        _history = history;
        _stats = stats;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _clearHistory() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(tr('clear_history')),
        content: Text(tr('clear_history_confirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _historyService.clearHistory();
      _loadHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('history_title')),
        actions: [
          if (_history.isNotEmpty) ...[
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                try {
                  final file = await ExportService.exportHistoryToCSV(_history.cast<ImcResult>());
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(tr('export_success')),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  }
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(tr('export_error')),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  }
                }
              },
              tooltip: tr('export_csv'),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _clearHistory,
            ),
          ],
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _history.isEmpty
              ? _buildEmptyState()
              : _buildHistoryList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 64,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: AppSizes.paddingLarge),
          Text(
            tr('no_history'),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList() {
    return Column(
      children: [
        if (_stats != null) _buildStatsCard(),
        Expanded(
          child: ListView.builder(
            itemCount: _history.length,
            itemBuilder: (context, index) {
              final item = _history[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium,
                  vertical: AppSizes.paddingSmall,
                ),
                child: ListTile(
                  title: Text(
                    tr('imc_result', namedArgs: {'value': item.value.toStringAsFixed(1)}),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${tr(item.category)} — ${DateFormat('dd/MM/yyyy').format(item.date)}'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCard() {
    final stats = _stats!;
    return Card(
      margin: const EdgeInsets.all(AppSizes.paddingMedium),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('stats_title'),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.paddingSmall),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(tr('total_label'), '${stats.totalEntries}'),
                ),
                Expanded(
                  child: _buildStatItem(tr('average_label'), stats.averageImc.toFormattedString()),
                ),
                Expanded(
                  child: _buildStatItem(tr('highest_label'), stats.highestImc.toFormattedString()),
                ),
                Expanded(
                  child: _buildStatItem(tr('lowest_label'), stats.lowestImc.toFormattedString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
} 