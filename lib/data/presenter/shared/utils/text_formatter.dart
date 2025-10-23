import 'package:flutter/services.dart';
import 'package:characters/characters.dart';

class OnlyLettersFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'[a-zA-Z]'); 

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered = newValue.text.characters.where((c) => _regExp.hasMatch(c)).join();
    return newValue.copyWith(
      text: filtered,
      selection: updateCursorPosition(filtered),
    );
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.collapsed(offset: text.length);
  }
}
