import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('IMC: 22.5'),
      subtitle: const Text('Peso normal'),
      trailing: const Text('01/07/2024'),
    );
  }
} 