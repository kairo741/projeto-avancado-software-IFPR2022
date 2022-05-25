class User {
  int? id;
  String name;
  String phone;
  DateTime age;
  bool isPremium;
  bool active;

  User({
    this.id,
    required this.name,
    required this.phone,
    required this.age,
    this.isPremium = false,
    this.active = true,
  });
}
