import 'package:dio_desafio_imc/controller/person_controller.dart';
import 'package:dio_desafio_imc/model/list_person.dart';
import 'package:dio_desafio_imc/model/person.dart';
import 'package:dio_desafio_imc/view/widgets/historic_list_widget.dart';
import 'package:dio_desafio_imc/view/widgets/imc_fields_widgets.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final controller = PersonController();
  final person = Person.empty();
  final ListPerson listPerson = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: ImcFieldsWidget(
              person: person,
              listPerson: listPerson,
              controller: controller,
            ),
          ),
          Expanded(
            flex: 2,
            child: HistoricListWidget(
              list: listPerson,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
