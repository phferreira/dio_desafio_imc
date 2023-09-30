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
        person.imc = person.weight / (person.height * person.height);
        person.imc = double.parse(person.imc.toStringAsFixed(2));
        value = person.imc;

        if (value <= 16) {
          message = 'Magreza grave';
        } else if (value <= 17) {
          message = 'Magreza moderada';
        } else if (value <= 18.5) {
          message = 'Magreza leve';
        } else if ((value > 18.5) && (value < 25)) {
          message = 'Saudavel';
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
