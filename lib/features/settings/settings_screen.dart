import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('settings_title')),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text(tr('dark_theme')),
            trailing: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(),
            ),
          ),
          // Futuras opções podem ser adicionadas aqui
        ],
      ),
    );
  }
} 