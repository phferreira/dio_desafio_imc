class Person {
  String name;
  double weight;
  double height;

  Person({
    required this.name,
    required this.weight,
    required this.height,
  });

  Person.empty()
      : name = '',
        weight = 0.0,
        height = 0.0;
}
