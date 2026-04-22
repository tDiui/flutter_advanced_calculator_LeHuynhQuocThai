import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/history_provider.dart';

class SettingsScreen extends StatelessWidget {

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider =
    Provider.of<ThemeProvider>(context);

    final historyProvider =
    Provider.of<HistoryProvider>(context);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Settings"),
      ),

      body: ListView(

        children: [

          /// DARK MODE

          SwitchListTile(

            title: const Text("Dark Mode"),

            value: themeProvider.isDark,

            onChanged: (value) {

              themeProvider.toggleTheme();

            },

          ),

          /// CLEAR HISTORY

          ListTile(

            leading: const Icon(Icons.delete),

            title: const Text("Clear History"),

            onTap: () {

              historyProvider.clearHistory();

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content:
                  Text("History Cleared"),
                ),

              );

            },

          ),

        ],

      ),

    );

  }

}