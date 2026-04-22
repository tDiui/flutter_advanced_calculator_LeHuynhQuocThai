import 'package:flutter/material.dart';

import '../models/calculation_history.dart';
import '../services/storage_service.dart';

class HistoryProvider
    extends ChangeNotifier {

  List<CalculationHistory> _history =
  [];

  List<CalculationHistory>
  get history => _history;

  /// LOAD HISTORY

  Future<void> loadHistory() async {

    _history =
    await StorageService.loadHistory();

    notifyListeners();

  }

  /// ADD HISTORY

  Future<void> addHistory(
      String expression,
      String result) async {

    _history.insert(

      0,

      CalculationHistory(

        expression: expression,
        result: result,
        time: DateTime.now(),

      ),

    );

    /// limit 50 records

    if (_history.length > 50) {

      _history.removeLast();

    }

    await StorageService.saveHistory(
        _history);

    notifyListeners();

  }

  /// CLEAR HISTORY

  Future<void> clearHistory() async {

    _history.clear();

    await StorageService.saveHistory(
        _history);

    notifyListeners();

  }

}