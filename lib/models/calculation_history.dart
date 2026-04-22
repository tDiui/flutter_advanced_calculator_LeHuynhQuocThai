class CalculationHistory {

  final String expression;
  final String result;
  final DateTime time;

  CalculationHistory({
    required this.expression,
    required this.result,
    required this.time,
  });

  Map<String, dynamic> toJson() {

    return {

      'expression': expression,
      'result': result,
      'time': time.toIso8601String(),

    };

  }

  factory CalculationHistory.fromJson(
      Map<String, dynamic> json) {

    return CalculationHistory(

      expression: json['expression'],
      result: json['result'],
      time: DateTime.parse(json['time']),

    );

  }

}