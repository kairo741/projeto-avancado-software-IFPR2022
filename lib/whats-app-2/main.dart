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
User me = User(name: "Kairo");

const String menu = """
  Você pode:
  
  1 ☄ Enviar mensagem
  2 ☄ Novo contato
  3 ☄ Deletar contato
  4 ☄ Ação (como: tremer a tela, ligar e etc...)
  5 ☄ Outro
  0 ☄ Sair
  """;

/// Forma de "persistencia" dos dados em memória
List<User> contacts = [];

/// Função principal onde o usuário escolhe as opções
/// do menu. São aplicados os conceitos de função anonima
/// e a funções recebendo funções por parâmetro
chooseOption() {
  String option = "";
  while (option != "0") {
    printMenus([logo, menu]);
    option = stdin.readLineSync() ?? "0";
    switch (option) {
      case "1":
        wpp2Action(createMessage, contacts);
        break;
      case "2":
        addContact();
        break;
      case "3":
        wpp2Action((contact) => contacts.remove(contact), contacts);
        break;
      case "0":
        print("Saindo...");
        break;
      default:
        option = "0";
        print("Saindo...");
        break;
    }
  }
}

//region Função que recebe uma função sem definição, por parâmetro
wpp2Action(Function chosenOption, List<User> contactsList) {
  if (contactsList.isNotEmpty) {
    chosenOption(chooseUser());
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
  return Message(sender: sender, recipient: recipient, content: content);
}

printMenus(List<String> menus) {
  for (var element in menus) {
    print(element);
  }
}
//endregion

//region Funções com parâmetros nomeados e posicionais

/// 9) Uma única função com parâmetros nomeados e posicionais;
shakeScreen(User contact, {int seconds = 4, String side = "RIGHT"}) {
  Message(content: "side:$side,seconds$seconds", recipient: contact, sender: me);
}

//endregion
