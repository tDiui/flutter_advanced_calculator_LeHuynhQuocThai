import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calculator_provider.dart';

class DisplayArea extends StatelessWidget {

  const DisplayArea({super.key});

  @override
  Widget build(BuildContext context) {

    final provider =
    Provider.of<CalculatorProvider>(context);

    return Container(

      width: double.infinity,

      padding:
      const EdgeInsets.all(24),

      margin:
      const EdgeInsets.all(24),

      decoration: BoxDecoration(

        color: const Color(0xFF424242),

        borderRadius:
        BorderRadius.circular(24),

      ),

      child: Column(

        mainAxisAlignment:
        MainAxisAlignment.end,

        crossAxisAlignment:
        CrossAxisAlignment.end,

        children: [

          SingleChildScrollView(
            scrollDirection:
            Axis.horizontal,

            reverse: true,

            child: Text(

              provider.expression,

              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),

            ),
          ),

          const SizedBox(height: 12),

          Text(

            provider.result,

            style: const TextStyle(
              fontSize: 32,
              fontWeight:
              FontWeight.bold,
              color: Colors.white,
            ),

          ),

        ],

      ),

    );

  }

}