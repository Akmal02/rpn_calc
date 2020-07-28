import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpn_calc/screens/calc/calc_model.dart';

class CalcInputPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final input =
        context.select<CalcModel, String>((model) => model.currentInput);

    if (input == null || input.isEmpty) return SizedBox();
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.black12,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Text(input,
            style: TextStyle(fontSize: 28, color: Colors.white), maxLines: 1),
      ),
    );
  }
}
