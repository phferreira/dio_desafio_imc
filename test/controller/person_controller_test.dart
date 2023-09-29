import 'package:dio_desafio_imc/controller/person_controller.dart';
import 'package:dio_desafio_imc/model/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final person = Person.empty();
  final controller = PersonController();

  test(
    'Must be return 24.69 when weight 80.0 and height 1.80.',
    () {
      person.weight = 80.0;
      person.height = 1.80;

      controller.calculateImc(person);

      expect(controller.value, 24.69);
      expect(controller.message, 'IMC normal.');
    },
  );

  test(
    'Must be return 0 when weight 80.0 and height 0.00.',
    () {
      person.weight = 80.0;
      person.height = 0.00;

      controller.calculateImc(person);

      expect(controller.value, 0.0);
      expect(controller.message, 'Informação invalida!');
    },
  );

  test(
    'Must be return 0 when weight 0.0 and height 1.80.',
    () {
      person.weight = 0.0;
      person.height = 1.80;

      controller.calculateImc(person);

      expect(controller.value, 0.0);
      expect(controller.message, 'Informação invalida!');
    },
  );

  test(
    'Must be return 0 when weight 0.0 and height 0.00.',
    () {
      person.weight = 0.0;
      person.height = 0.0;

      controller.calculateImc(person);

      expect(controller.value, 0.0);
      expect(controller.message, 'Informação invalida!');
    },
  );
}
