import 'package:flutter/services.dart';

class CpfFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // remove tudo que não for número
    String numbersOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // limita a 11 dígitos
    if (numbersOnly.length > 11) {
      numbersOnly = numbersOnly.substring(0, 11);
    }

    String formatted = '';
    for (int i = 0; i < numbersOnly.length; i++) {
      formatted += numbersOnly[i];
      // adiciona pontos e traço nos lugares corretos
      if (i == 2 || i == 5) formatted += '.';
      if (i == 8) formatted += '-';
    }

    // tenta manter o cursor na posição correta
    int offset = formatted.length;
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
