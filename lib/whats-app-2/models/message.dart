// ignore_for_file: constant_identifier_names

import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/user.dart';

class Message {
  User sender;
  User recipient;
  String content;
  MessageType type;
  DateTime sendDate;

  Message({
    required this.sender,
    required this.recipient,
    required this.content,
    this.type = MessageType.TEXT,
    required this.sendDate,
  });
}

enum MessageType { SHAKE, TEXT, STICKER }
