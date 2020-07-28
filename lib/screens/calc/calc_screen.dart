import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpn_calc/screens/calc/calc_model.dart';
import 'package:rpn_calc/screens/calc/components/calc_input_panel.dart';
import 'package:rpn_calc/screens/calc/components/calc_stack_view.dart';

import 'components/calc_key_pad.dart';

class CalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalcModel(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Material(
                color: Colors.blueGrey.shade700,
                child: CalcStackView(),
              ),
            ),
            CalcKeyPad(),
          ],
        ),
      ),
    );
  }
}
