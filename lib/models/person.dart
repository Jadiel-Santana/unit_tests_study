class Person {
  final String name;
  final double age;
  final double height;
  final double weight;

  Person({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  double get imc {
    var result = weight / (height * height);
    result = result * 100;
    return result.roundToDouble() / 100;
  }

  bool get isOlder => (age >= 18);
}