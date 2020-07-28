import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rpn_calc/screens/calc/calc_model.dart';

import 'calc_key_data.dart';

class CalcKeyPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<List<CalcKeyData>> keyPadList = [
      [
        CalcKeyData(symbol: 'C', op: () => _clearAll(context)),
        CalcKeyData(symbol: '7', op: () => _keyIn(context, '7')),
        CalcKeyData(symbol: '4', op: () => _keyIn(context, '4')),
        CalcKeyData(symbol: '1', op: () => _keyIn(context, '1')),
        CalcKeyData(symbol: '0', op: () => _keyIn(context, '0')),
      ],
      [
        CalcKeyData(symbol: '/', op: () => _performOp(context, '/')),
        CalcKeyData(symbol: '8', op: () => _keyIn(context, '8')),
        CalcKeyData(symbol: '5', op: () => _keyIn(context, '5')),
        CalcKeyData(symbol: '2', op: () => _keyIn(context, '2')),
        CalcKeyData(symbol: '.', op: () => _keyIn(context, '.')),
      ],
      [
        CalcKeyData(symbol: '*', op: () => _performOp(context, '*')),
        CalcKeyData(symbol: '9', op: () => _keyIn(context, '9')),
        CalcKeyData(symbol: '6', op: () => _keyIn(context, '6')),
        CalcKeyData(symbol: '3', op: () => _keyIn(context, '3')),
        CalcKeyData(symbol: '-', op: () => _keyIn(context, '-')),
      ],
      [
        CalcKeyData(
            symbol: '<',
            op: () => _backspace(context),
            second: () => _clearInput(context)),
        CalcKeyData(symbol: '-', op: () => _performOp(context, '-')),
        CalcKeyData(symbol: '+', op: () => _performOp(context, '+')),
        CalcKeyData(symbol: 'E', op: () => _enter(context), weight: 2),
      ],
    ];
    return Container(
      height: 340,
      child: Row(
        children: [
          for (var calcKeyColumn in keyPadList)
            Expanded(
              child: Column(
                children: [
                  for (var key in calcKeyColumn) _buildKey(context, key)
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _buildKey(BuildContext context, CalcKeyData key) {
    return Expanded(
      flex: key.weight,
      child: Material(
        color: key.color,
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              key.symbol,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: key.textColor),
            ),
          ),
          onTap: () {
            HapticFeedback.vibrate();
            key.op?.call();
          },
          onLongPress: () {
            key.second?.call();
          },
        ),
      ),
    );
  }

  void _clearInput(BuildContext context) {
    final model = context.read<CalcModel>();
    model.clearCurrent();
  }

  void _clearAll(BuildContext context) {
    final model = context.read<CalcModel>();
    model.reset();
  }

  void _keyIn(BuildContext context, String symbol) {
    final model = context.read<CalcModel>();
    model.currentInput += symbol;
  }

  void _backspace(BuildContext context) {
    final model = context.read<CalcModel>();
    final input = model.currentInput;
    if (input.isNotEmpty)
      model.currentInput = input.substring(0, input.length - 1);
  }

  void _enter(BuildContext context) {
    final model = context.read<CalcModel>();
    model.pushCurrent();
  }

  void _performOp(BuildContext context, String symbol) {
    final model = context.read<CalcModel>();
    switch (symbol) {
      case '+':
        model.performOperationDouble(
            (a, b) => '${double.parse(a) + double.parse(b)}');
        break;
      case '-':
        model.performOperationDouble(
            (a, b) => '${double.parse(a) - double.parse(b)}');
        break;
      case '*':
        model.performOperationDouble(
            (a, b) => '${double.parse(a) * double.parse(b)}');
        break;
      case '/':
        model.performOperationDouble(
            (a, b) => '${double.parse(a) / double.parse(b)}');
        break;
    }
  }
}
