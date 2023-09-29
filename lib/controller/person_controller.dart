import 'package:dio_desafio_imc/model/person.dart';
import 'package:flutter/material.dart';

class PersonController extends ValueNotifier<double> {
  String message = '';

  PersonController() : super(0);

  calculateImc(Person person) {
    try {
      //
      if ((person.height == 0) || (person.weight == 0)) {
        // throw Exception();
        value = 0;
        message = 'Informação invalida!';
      } else {
        final double imc = person.weight / (person.height * person.height);
        value = double.parse(imc.toStringAsFixed(2));

        if ((value >= 15) && (value <= 30)) {
          message = 'IMC normal.';
        } else {
          message = 'Sobrepeso';
        }
      }
      notifyListeners();
    } catch (e) {
      value = 0;
      message = 'Erro ao calcular IMC.';
      notifyListeners();
    }
  }
}
