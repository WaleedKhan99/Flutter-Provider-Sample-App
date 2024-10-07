import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/provider_theme_change.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final providerThemeChange = Provider.of<ProviderThemeChange>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Theme Selection")),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: providerThemeChange.themeMode,
              onChanged: providerThemeChange.setTheme),
          RadioListTile<ThemeMode>(
              title: Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: providerThemeChange.themeMode,
              onChanged: providerThemeChange.setTheme),
          RadioListTile<ThemeMode>(
              title: Text('Default Mode'),
              value: ThemeMode.system,
              groupValue: providerThemeChange.themeMode,
              onChanged: providerThemeChange.setTheme)
        ],
      ),
    );
  }
}
