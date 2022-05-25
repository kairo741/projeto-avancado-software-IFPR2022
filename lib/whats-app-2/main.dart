import 'dart:io';

import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/message.dart';
import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/user.dart';

import 'shared/constants.dart';

///WhatsApp 2

const String logo = """Seja bem-vindo ao
 _       ____          __       ___                   ___ 
| |     / / /_  ____ _/ /______/   |  ____  ____     |__ \\
| | /| / / __ \\/ __ `/ __/ ___/ /| | / __ \\/ __ \\    __/ /
| |/ |/ / / / / /_/ / /_(__  ) ___ |/ /_/ / /_/ /   / __/ 
|__/|__/_/ /_/\\__,_/\\__/____/_/  |_/ .___/ .___/   /____/ 
                                  /_/   /_/""";
User me = User(name: "Kairo", age: DateTime.now());

const String menu = """
  Você pode:
  
  1 ☄ Enviar mensagem
  2 ☄ Novo contato
  3 ☄ Deletar contato
  4 ☄ Ação (como: tremer a tela, ligar e etc...)
  5 ☄ Outro
  0 ☄ Sair
  """;

/// Forma de "persistência" dos dados em memória
List<User> contacts = [];
List<Message> messages = [];

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
    try {
      chosenOption(chooseUser());
    } catch (e) {
      printError("Algum erro ocorreu");
    }
  } else {
    print("Você não tem nenhum contato! Pressione ENTER para continuar...");
    stdin.readLineSync();
  }
}

User createUser(String question) {
  print(question);
  // todo - perguntar a idade (receber outra questão por parâmetro)
  var newUser = User(name: stdin.readLineSync()!, age: DateTime.now());
  validateAge(newUser);
  return newUser;
}

addContact() {
  contacts.add(createUser("Nome do contato:"));
}

User chooseUser() {
  contacts.asMap().forEach((index, contact) {
    print("${index + 1} - ${contact.name}");
  });
  print("Qual contato?");
  try {
    return contacts[int.parse(stdin.readLineSync()!) - 1];
  } catch (e) {
    printError("Deve-se digitar somente números");
    rethrow;
  }
}

Message createMessage(User recipient) {
  var sender = createUser("Quem é o você?");
  print("Qual a mensagem?");
  try {
    String content = stdin.readLineSync()!;
    return Message(
        sender: sender, recipient: recipient, content: content, sendDate: DateTime.now());
  } catch (e) {
    printError("A mensagem não pode ser vazia");
    rethrow;
  }
}

sendMessage(Message message) {
  validateUserMessage(message.sender);
  messages.add(message);
}

List<Message> getUserMessagesBetweenDates(
    {required User user, required DateTime initDate, required DateTime endDate}) {
  return messages
      .where((message) => (message.sender == user &&
          message.sendDate.isAfter(initDate) &&
          message.sendDate.isBefore(endDate)))
      .toList();
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
  Message(
      content: "side:$side,seconds$seconds",
      recipient: contact,
      sender: me,
      sendDate: DateTime.now());
}

//endregion

// region Utils
int calculateAge(DateTime userAge) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - userAge.year;
  int currentMonth = currentDate.month;
  int userMonthBirt = userAge.month;
  if (userMonthBirt > currentMonth) {
    age--;
  } else if (currentMonth == userMonthBirt) {
    if (userAge.day > currentDate.day) {
      age--;
    }
  }
  return age;
}

//endregion

//region Tratamento de erros
printError(e) {
  print('\x1B[31m$e\x1B[0m');
}

/// Regra de negócio = Para usar o App o usuário não pode ser menor que 13 anos
/// Para verificar o teto da idade válida a idade não pode ser maior que 120
validateAge(User user) {
  var userAge = calculateAge(user.age);
  if (userAge.isNegative || userAge > userAgeMax) {
    throw Exception("Valor de idade inválida");
  }
  if (userAge < userAgeMin) {
    throw Exception("Para usar o App é necessário ser maior que 13 anos!");
  }
}

/// Regra de negócio = Usuários que não sejam premium podem enviar somente 100 mensagens por hora
validateUserMessage(User user) {
  if (!user.isPremium) {
    var currentDate = DateTime.now();
    var userMessages = getUserMessagesBetweenDates(
        user: user,
        endDate: currentDate,
        initDate: currentDate.subtract(Duration(hours: normalUserDefaultHourFilter)));

    if (userMessages.length > normalUserMaxMessages) {
      throw Exception("Você excedeu o máximo de mensagens!");
    }
  }
}

//endregion
