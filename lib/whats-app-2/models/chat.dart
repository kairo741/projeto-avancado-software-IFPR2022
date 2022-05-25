import 'user.dart';

class Chat {
  int? id;
  String nickname;
  List<User> receivers;
  bool isBlocked;
  bool isGroup;

  Chat({
    this.id,
    required this.nickname,
    required this.receivers,
    this.isBlocked = false,
    required this.isGroup,
  });
}
