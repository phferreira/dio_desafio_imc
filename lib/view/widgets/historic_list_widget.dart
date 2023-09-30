import 'package:dio_desafio_imc/controller/person_controller.dart';
import 'package:dio_desafio_imc/model/list_person.dart';
import 'package:flutter/material.dart';

class HistoricListWidget extends StatelessWidget {
  final ListPerson list;
  final PersonController controller;

  const HistoricListWidget({
    super.key,
    required this.list,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text('Peso: ${list[index].weight}'),
                  Text('Altura: ${list[index].height}'),
                  Text('IMC: ${list[index].imc}'),
                ],
              ),
            );
          },
          itemCount: list.length,
        );
      },
    );
  }
}
