import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/calculation_history.dart';

class StorageService {

  static const String historyKey =
      "calculator_history";

  /// SAVE HISTORY

  static Future<void> saveHistory(
      List<CalculationHistory> history) async {

    final prefs =
    await SharedPreferences.getInstance();

    List<String> historyJson =

    history.map(
          (item) =>
          jsonEncode(item.toJson()),
    ).toList();

    await prefs.setStringList(
        historyKey,
        historyJson);

  }

  /// LOAD HISTORY

  static Future<List<CalculationHistory>>
  loadHistory() async {

    final prefs =
    await SharedPreferences.getInstance();

    List<String>? historyJson =
    prefs.getStringList(historyKey);

    if (historyJson == null) {
      return [];
    }

    return historyJson.map(

          (item) {

        return CalculationHistory.fromJson(
            jsonDecode(item));

      },

    ).toList();

  }

}