import 'package:dio_desafio_imc/controller/person_controller.dart';
import 'package:dio_desafio_imc/core/formatters/currency_mask.dart';
import 'package:dio_desafio_imc/model/list_person.dart';
import 'package:dio_desafio_imc/model/person.dart';
import 'package:flutter/material.dart';

class ImcFieldsWidget extends StatelessWidget {
  final Person person;
  final ListPerson listPerson;
  final PersonController controller;

  const ImcFieldsWidget({
    super.key,
    required this.person,
    required this.listPerson,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    CurrencyMask(integer: 3, decimal: 3),
                  ],
                  onChanged: (value) => person.weight = double.tryParse(value.replaceFirst(RegExp(','), '.')) ?? 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    CurrencyMask(
                      integer: 1,
                      decimal: 2,
                    ),
                  ],
                  onChanged: (value) => person.height = double.tryParse(value.replaceFirst(RegExp(','), '.')) ?? 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller.calculateImc(person);
                    listPerson.add(Person.copyWith(person));
                  },
                  child: const Text('Calcular'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text('Seu IMC: ${controller.value}'),
              Visibility(
                visible: controller.message.isNotEmpty,
                child: Text(controller.message),
              ),
            ],
          ),
        );
      },
    );
  }
}
