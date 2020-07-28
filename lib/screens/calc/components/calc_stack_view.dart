import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpn_calc/screens/calc/calc_model.dart';
import 'package:rpn_calc/screens/calc/components/calc_input_panel.dart';

class CalcStackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CalcModel>();

    return ListView.separated(
      reverse: true,
      padding: EdgeInsets.all(8) +
          EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      itemCount: model.stacks.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return CalcInputPanel();
        }
        return Material(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black12,
          child: Container(
            padding: EdgeInsets.all(12),
            child: Text(
              model.stacks[model.stacks.length - index],
              style: TextStyle(fontSize: 28, color: Colors.white),
              maxLines: 1,
              textAlign: TextAlign.end,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        if (index == 0 && (model.currentInput.isEmpty)) return SizedBox();
        return SizedBox(height: 8);
      },
    );
  }
}
