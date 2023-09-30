class Person {
  String name;
  double weight;
  double height;
  double imc;

  Person({
    required this.name,
    required this.weight,
    required this.height,
    required this.imc,
  });

  Person.empty()
      : name = '',
        weight = 0.0,
        height = 0.0,
        imc = 0.0;

  Person.copyWith(Person copy)
      : name = copy.name,
        weight = copy.weight,
        height = copy.height,
        imc = copy.imc;
}
