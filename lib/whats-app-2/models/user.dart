class User {
  String name;
  DateTime age;
  bool active;

  User({
    required this.name,
    required this.age,
    this.active = true,
  });
}
