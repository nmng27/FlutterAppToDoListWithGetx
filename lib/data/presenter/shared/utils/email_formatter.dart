import 'package:flutter/services.dart';
import 'dart:math';

class EmailInputFormatter extends TextInputFormatter {
  // permite letras, números, ., -, _, e @

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // remove tudo que não for permitido
    final filtered = newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9@._\-]'), '');

    // tenta manter o cursor no lugar correto
    final newOffset = min(filtered.length, newValue.selection.end);

    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: newOffset),
      composing: TextRange.empty,
    );
  }
}
