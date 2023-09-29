import 'package:dio_desafio_imc/model/person.dart';
import 'package:flutter/material.dart';

class PersonController extends ValueNotifier<double> {
  String message = '';

  PersonController() : super(0);

  calculateImc(Person person) {
    try {
      if ((person.height <= 0.0) || (person.height > 3.0)) {
        value = 0;
        message = 'Informação invalida para o campo altura!';
      } else if ((person.weight <= 0.0) || (person.weight > 300)) {
        value = 0;
        message = 'Informação invalida para o campo peso!';
      } else {
        final double imc = person.weight / (person.height * person.height);
        value = double.parse(imc.toStringAsFixed(2));

        if (value <= 18.5) {
          message = 'Baixo peso';
        } else if ((value > 18.5) && (value < 25)) {
          message = 'Peso normal';
        } else if ((value > 25) && (value < 30)) {
          message = 'Sobrepeso';
        } else if ((value > 30) && (value < 35)) {
          message = 'Obesidade grau I';
        } else if ((value > 35) && (value < 40)) {
          message = 'Obesidade grau II';
        } else {
          message = 'Obesidade grau III';
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
