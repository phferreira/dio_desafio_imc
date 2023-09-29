import 'package:dio_desafio_imc/controller/person_controller.dart';
import 'package:dio_desafio_imc/core/formatters/currency_mask.dart';
import 'package:dio_desafio_imc/model/person.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final controller = PersonController();
  final person = Person.empty();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
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
                  setState(() {});
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
      ),
    );
  }
}
