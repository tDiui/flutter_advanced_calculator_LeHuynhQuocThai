import 'package:flutter/material.dart';

import '../widgets/display_area.dart';
import '../widgets/button_grid.dart';
import '../widgets/mode_selector.dart';

import 'history_screen.dart';
import 'settings_screen.dart';

class CalculatorScreen extends StatelessWidget {

  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title:
        const Text("Advanced Calculator"),

        actions: [

          /// HISTORY BUTTON

          IconButton(

            icon:
            const Icon(Icons.history),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                  const HistoryScreen(),

                ),

              );

            },

          ),

          /// SETTINGS BUTTON (NÚT BỊ THIẾU)

          IconButton(

            icon:
            const Icon(Icons.settings),

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                  const SettingsScreen(),

                ),

              );

            },

          ),

        ],

      ),

      body: SafeArea(

        child: Column(

          children: [

            const ModeSelector(),

            const Expanded(
              flex: 3,
              child: DisplayArea(),
            ),

            const Expanded(
              flex: 5,
              child: ButtonGrid(),
            ),

          ],

        ),

      ),

    );

  }

}