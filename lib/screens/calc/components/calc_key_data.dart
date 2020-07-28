import 'package:flutter/material.dart';

class CalcKeyData {
  final int weight;
  final String symbol;
  final VoidCallback op;
  final VoidCallback second;
  final Color color;
  final Color textColor;

  const CalcKeyData({
    this.weight = 1,
    @required this.symbol,
    this.op,
    this.second,
    this.color = Colors.blueGrey,
    this.textColor = Colors.white,
  });
}
