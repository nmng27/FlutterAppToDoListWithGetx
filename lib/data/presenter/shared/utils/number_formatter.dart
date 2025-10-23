import 'package:flutter/services.dart';
import 'dart:math';

class NumbersFormatter extends TextInputFormatter {
  // permite apenas dígitos, ponto e vírgula

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // remove tudo que não for número, ponto ou vírgula
    final filtered = newValue.text.replaceAll(RegExp(r'[^0-9\.,]'), '');

    // tenta preservar o cursor
    final newOffset = min(filtered.length, newValue.selection.end);
    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: newOffset),
      composing: TextRange.empty,
    );
  }
}
