import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../models/calculator_mode.dart';

class ModeSelector extends StatelessWidget {

  const ModeSelector({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
    Provider.of<CalculatorProvider>(
        context);

    return Padding(

      padding:
      const EdgeInsets.all(8),

      child: Row(

        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          buildButton(
            context,
            "Basic",
            CalculatorMode.basic,
          ),

          const SizedBox(width: 10),

          buildButton(
            context,
            "Scientific",
            CalculatorMode.scientific,
          ),

          const SizedBox(width: 10),

          buildButton(
            context,
            "Programmer",
            CalculatorMode.programmer,
          ),

        ],

      ),

    );

  }

  Widget buildButton(
      BuildContext context,
      String title,
      CalculatorMode mode) {

    final provider =
    Provider.of<CalculatorProvider>(
        context,
        listen: false);

    return ElevatedButton(

      onPressed: () {

        provider.setMode(mode);

      },

      child: Text(title),

    );

  }

}