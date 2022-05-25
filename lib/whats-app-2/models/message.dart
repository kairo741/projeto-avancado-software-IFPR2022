// ignore_for_file: constant_identifier_names

import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/user.dart';

import 'chat.dart';

class Message {
  int? id;
  User sender;
  Chat chat;
  String content;
  MessageType type;
  DateTime sendDate;

  Message({
    this.id,
    required this.sender,
    required this.chat,
    required this.content,
    this.type = MessageType.TEXT,
    required this.sendDate,
  });
}

enum MessageType { SHAKE, TEXT, STICKER }
