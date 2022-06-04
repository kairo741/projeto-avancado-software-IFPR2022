import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/wallet.dart';

class User {
  int? id;
  String name;
  String phone;
  Wallet? wallet;
  DateTime age;
  bool isPremium;
  bool active;

  User({
    this.id,
    required this.name,
    required this.phone,
    required this.age,
    this.wallet,
    this.isPremium = false,
    this.active = true,
  });
}
