import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/calculator_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/history_provider.dart';

import 'screens/calculator_screen.dart';

void main() {

  runApp(
    const MyApp(),
  );

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        /// CALCULATOR

        ChangeNotifierProvider(
          create: (_) =>
              CalculatorProvider(),
        ),

        /// THEME

        ChangeNotifierProvider(
          create: (_) {

            final provider =
            ThemeProvider();

            provider.loadTheme();

            return provider;

          },
        ),

        /// HISTORY

        ChangeNotifierProvider(
          create: (_) {

            final provider =
            HistoryProvider();

            provider.loadHistory();

            return provider;

          },
        ),

      ],

      /// APPLY THEME

      child: Consumer<ThemeProvider>(

        builder: (
            context,
            themeProvider,
            child,
            ) {

          return MaterialApp(

            debugShowCheckedModeBanner: false,

            theme:
            themeProvider.themeData,

            home:
            const CalculatorScreen(),

          );

        },

      ),

    );

  }

}