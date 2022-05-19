class User {
  String name;
  DateTime age;
  bool isPremium;
  bool active;

  User({
    required this.name,
    required this.age,
    this.isPremium = false,
    this.active = true,
  });
}
