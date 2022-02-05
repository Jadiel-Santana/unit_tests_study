class Person {
  final String id;
  final String name;
  final int age;
  final double height;
  final double weight;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] as String,
      name: map['name'] as String,
      age: map['age'],
      height: map['height'] * 1.0,
      weight: map['weight'] * 1.0,
    );
  }

  double get imc {
    var result = weight / (height * height);
    result = result * 100;
    return result.roundToDouble() / 100;
  }

  bool get isOlder => (age >= 18);
}