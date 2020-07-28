import 'package:flutter/foundation.dart';

class CalcModel with ChangeNotifier {
  String _currentInput = "";

  List<String> stacks = [];

  String get currentInput => _currentInput;

  set currentInput(String currentInput) {
    _currentInput = currentInput;
    notifyListeners();
  }

  void clearCurrent() {
    _currentInput = "";
    notifyListeners();
  }

  void pushCurrent() {
    // Duplicate stack if input is empty
    if (_currentInput.isEmpty) {
      if (stacks.isEmpty) return;
      _currentInput = stacks.last;
    }
    stacks.add(_currentInput);
    _currentInput = "";
    notifyListeners();
  }

  void reset() {
    stacks = [];
    _currentInput = "";
    notifyListeners();
  }

  void performOperationDouble(String Function(String a, String b) operation) {
    // Push any current input and perform operation immediately
    if (_currentInput.isNotEmpty) {
      pushCurrent();
    }
    if (stacks.length < 2) return;
    final a = stacks.removeLast();
    final b = stacks.removeLast();
    final c = operation(a, b);
    stacks.add(c);
    notifyListeners();
  }
}
