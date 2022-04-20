// ignore_for_file: constant_identifier_names

import 'package:projeto_avancado_software_ifpr2022/functions-project/models/user.dart';

class Message {
  User user;
  String content;
  MessageType type;


  Message({
    required this.user,
    required this.content,
    required this.type,
  });


}


enum MessageType{
  SHAKE,
  TEXT,
  STICKER
}