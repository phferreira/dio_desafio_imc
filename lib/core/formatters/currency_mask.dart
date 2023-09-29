import 'package:flutter/services.dart';

class CurrencyMask extends TextInputFormatter {
  final int decimal;
  final int integer;

  CurrencyMask({this.integer = 2, this.decimal = 2});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text.replaceAll(RegExp(r'\D'), '');

    value = (int.tryParse(value) ?? 0).toString().split('').reversed.join();

    if (value.length <= decimal) value = value.padRight(decimal + 1, '0');

    final List<String> formated = [];

    for (var i = 0; i < value.length; i++) {
      if (i == decimal) {
        formated.insert(0, ',');
      }
      if (i < (integer + decimal)) {
        formated.insert(0, value[i]);
      }
    }

    return newValue.copyWith(
      text: formated.join(),
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: formated.length,
        ),
      ),
    );
  }
}
