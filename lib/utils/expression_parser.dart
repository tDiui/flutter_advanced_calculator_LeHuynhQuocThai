import 'package:math_expressions/math_expressions.dart';

class ExpressionParser {

  static String evaluate(String expression) {

    try {

      Parser parser = Parser();

      Expression exp =
      parser.parse(expression);

      ContextModel cm =
      ContextModel();

      double result =
      exp.evaluate(
        EvaluationType.REAL,
        cm,
      );

      return result.toString();

    } catch (e) {

      return "Error";

    }

  }

}