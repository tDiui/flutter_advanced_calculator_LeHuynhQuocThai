import 'expression_parser.dart';

class CalculatorLogic {

  String evaluateExpression(
      String expression) {

    return ExpressionParser
        .evaluate(expression);

  }

}