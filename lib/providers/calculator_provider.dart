import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/calculator_logic.dart';
import '../models/calculator_mode.dart';
import '../providers/history_provider.dart';

class CalculatorProvider extends ChangeNotifier {

  String _expression = "";
  String _result = "0";

  double _memory = 0;
  double get memory => _memory;

  CalculatorMode _mode =
      CalculatorMode.basic;

  final CalculatorLogic _logic =
  CalculatorLogic();

  String get expression => _expression;

  String get result => _result;

  CalculatorMode get mode => _mode;

  void setMode(
      CalculatorMode newMode) {

    _mode = newMode;

    notifyListeners();

  }

  /// ADD VALUE (NOW HAS CONTEXT)

  void addValue(
      String value,
      BuildContext context) {

    /// "="

    if (value == "=") {
      calculate(context);
      return;
    }

    /// CLEAR

    if (value == "C") {
      clear();
      return;
    }
    /// MEMORY FUNCTIONS

    if (value == "MC") {

      _memory = 0;

      notifyListeners();
      return;

    }

    if (value == "MR") {

      _expression +=
          _memory.toString();

      notifyListeners();
      return;

    }

    if (value == "M+") {

      double number =
          double.tryParse(_result) ?? 0;

      _memory += number;

      notifyListeners();
      return;

    }

    if (value == "M-") {

      double number =
          double.tryParse(_result) ?? 0;

      _memory -= number;

      notifyListeners();
      return;

    }
    /// SCIENTIFIC MODE

    if (value == "π") {
      _expression += "3.1416";
      notifyListeners();
      return;
    }

    if (value == "√") {
      _expression += "sqrt(";
      notifyListeners();
      return;
    }

    if (value == "sin" ||
        value == "cos" ||
        value == "tan" ||
        value == "log") {

      _expression += "$value(";

      notifyListeners();
      return;

    }

    /// PROGRAMMER MODE

    if (value == "HEX") {

      int number =
          int.tryParse(_expression) ?? 0;

      _result =
          number.toRadixString(16);

      notifyListeners();
      return;

    }

    if (value == "BIN") {

      int number =
          int.tryParse(_expression) ?? 0;

      _result =
          number.toRadixString(2);

      notifyListeners();
      return;

    }

    if (value == "AND" ||
        value == "OR" ||
        value == "XOR" ||
        value == "NOT" ||
        value == "<<" ||
        value == ">>") {

      _expression += " $value ";

      notifyListeners();
      return;

    }

    /// DEFAULT

    _expression += value;

    notifyListeners();

  }

  void clear() {

    _expression = "";
    _result = "0";

    notifyListeners();

  }

  /// CALCULATE + SAVE HISTORY

  void calculate(
      BuildContext context) {

    if (_expression.isEmpty) return;

    _result =
        _logic.evaluateExpression(
            _expression);

    /// SAVE HISTORY

    final historyProvider =
    Provider.of<HistoryProvider>(
        context,
        listen: false);

    historyProvider.addHistory(
        _expression,
        _result);

    notifyListeners();

  }

}