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
  2 ☄ Novo contato
  3 ☄ Deletar contato
  4 ☄ Ação (como: tremer a tela, ligar e etc...)
  5 ☄ Outro
  """;

List<User> contacts = [];

chooseOption() {
  while (true) {
    printMenus([logo, menu]);
    switch (stdin.readLineSync()) {
      case "1":
        wpp2Action(createMessage);
        break;
      case "2":
        addContact();
        break;
      case "3":
        wpp2Action((contact) => contacts.remove(contact));
        break;
      default:
        print("Saindo...");
        break;
    }
  }
}

// Função que recebe uma função sem definição, por parâmetro
wpp2Action(Function function) {
  if (contacts.isNotEmpty) {
    function(chooseUser());
  } else {
    print("Você não tem nenhum contato! Pressione ENTER para continuar...");
    stdin.readLineSync();
  }
}

User createUser(String question) {
  print(question);
  return User(name: stdin.readLineSync()!);
}

addContact() {
  contacts.add(createUser("Nome do contato:"));
}

User chooseUser() {
  contacts.asMap().forEach((index, contact) {
    print("${index + 1} - ${contact.name}");
  });
  print("Qual contato?");
  return contacts[int.parse(stdin.readLineSync()!) - 1];
}

Message createMessage(User recipient) {
  var sender = createUser("Quem é o você?");
  print("Qual a mensagem?");
  var content = stdin.readLineSync()!;
  return Message(sender: sender, recipient: recipient, content: content, type: MessageType.TEXT);
}

printMenus(List<String> menus) {
  for (var element in menus) {
    print(element);
  }
}
