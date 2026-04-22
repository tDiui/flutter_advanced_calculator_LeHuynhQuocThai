import 'package:flutter/material.dart';
import 'calculator_button.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../utils/constants.dart';
import '../models/calculator_mode.dart';

class ButtonGrid extends StatelessWidget {

  const ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
    Provider.of<CalculatorProvider>(
        context);

    List<List<String>> buttons;

    switch (provider.mode) {

      case CalculatorMode.scientific:

        buttons =
            AppConstants
                .scientificButtons;
        break;

      case CalculatorMode.programmer:

        buttons =
            AppConstants
                .programmerButtons;
        break;

      default:

        buttons =
            AppConstants
                .basicButtons;

    }

    return Column(

      children:

      buttons.map((row) {

        return Expanded(

          child: Row(

            children:

            row.map((text) {

              return CalculatorButton(

                text: text,

                onTap: () =>
                    provider.addValue(
                        text,
                        context),

              );

            }).toList(),

          ),

        );

      }).toList(),

    );

  }

}