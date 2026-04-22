import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(

      child: Padding(

        padding:
        const EdgeInsets.all(6),

        child: SizedBox(

          height: 70,

          child: ElevatedButton(

            onPressed: onTap,

            child: Text(

              text,

              style: const TextStyle(
                fontSize: 16,
                fontWeight:
                FontWeight.w500,
              ),

            ),

          ),

        ),

      ),

    );

  }

}