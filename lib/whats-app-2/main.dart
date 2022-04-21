import 'dart:io';

import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/message.dart';
import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/user.dart';

///WhatsApp 2

const String logo = """Seja bem-vindo ao
 _       ____          __       ___                   ___ 
| |     / / /_  ____ _/ /______/   |  ____  ____     |__ \\
| | /| / / __ \\/ __ `/ __/ ___/ /| | / __ \\/ __ \\    __/ /
| |/ |/ / / / / /_/ / /_(__  ) ___ |/ /_/ / /_/ /   / __/ 
|__/|__/_/ /_/\\__,_/\\__/____/_/  |_/ .___/ .___/   /____/ 
                                  /_/   /_/""";

const String menu = """
  Você pode:
  
  1 ☄ Enviar mensagem
  2 ☄ Ação (como: tremer a tela, ligar e etc...)
  3 ☄ Outro
  """;

chooseOption() {
  printMenus([logo, menu]);
  switch (stdin.readLineSync()) {
    case "1":
      wpp2Messages(createMessage);
      break;
    case "2":
      print("oi");
      break;
    default:
      print("Saindo...");
      break;
  }
}
// Função que recebe uma função sem definição, por parâmetro
wpp2Messages(Function function) {
  function();

}

User createUser(String question) {
  print(question);
  return User(name: stdin.readLineSync()!);
}

Message createMessage() {
  var sender = createUser("Quem é o você?");

  var recipient = createUser("Quem irá receber?");

  return Message(
      sender: sender,
      recipient: recipient,
      content: "content",
      type: MessageType.TEXT);
}

printMenus(List<String> menus) {
  menus.forEach((element) {
    print(element);
  });
}
