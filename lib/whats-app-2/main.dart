import 'dart:io';

import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/message.dart';
import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/user.dart';
import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/wallet.dart';

import 'models/chat.dart';
import 'shared/constants.dart';

///WhatsApp 2

const String logo = """Seja bem-vindo ao
 _       ____          __       ___                   ___ 
| |     / / /_  ____ _/ /______/   |  ____  ____     |__ \\
| | /| / / __ \\/ __ `/ __/ ___/ /| | / __ \\/ __ \\    __/ /
| |/ |/ / / / / /_/ / /_(__  ) ___ |/ /_/ / /_/ /   / __/ 
|__/|__/_/ /_/\\__,_/\\__/____/_/  |_/ .___/ .___/   /____/ 
                                  /_/   /_/""";
User me = User(
    name: "Kairo",
    age: DateTime.now(),
    phone: "44 997040429",
    isPremium: true,
    wallet: Wallet());

const String menu = """
  Você pode:
  
  1 ☄ Enviar mensagem
  2 ☄ Novo contato
  3 ☄ Deletar contato
  4 ☄ Criar grupo
  5 ☄ Bloquear contato/grupo
  6 ☄ Ação (como: tremer a tela, ligar e etc...)
  7 ☄ Outro
  0 ☄ Sair
  """;

/// Forma de "persistência" dos dados em memória
List<User> contactsTable = [];
List<Chat> chatsTable = [];
List<Message> messagesTable = [];

/// Função principal onde o usuário escolhe as opções
/// do menu. São aplicados os conceitos de função anonima
/// e a funções recebendo funções por parâmetro
chooseOption() {
  String option = "";
  generateData();
  while (option != "0") {
    printMenus([logo, menu]);
    option = stdin.readLineSync() ?? "0";
    switch (option) {
      case "1":
        wpp2Action(createMessage, contactsTable);
        break;
      case "2":
        addContact();
        break;
      case "3":
        wpp2Action((contact) => contactsTable.remove(contact), contactsTable);
        break;
      case "4":
        wpp2Action((contact) {
          List<User> contacts = [contact];
          print("Escolha os outros contatos: ");
          contacts.addAll(getListOfUser(chooseUser));
          print("Nome do grupo: ");
          createGroup(contacts, groupName: stdin.readLineSync()!);
        }, contactsTable);
        break;

      case "5":
        wpp2Action(blockContact, chatsTable, isUser: false);
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
wpp2Action(Function chosenOption, List contactsList, {bool isUser = true}) {
  if (contactsList.isNotEmpty) {
    try {
      chosenOption(isUser ? chooseUser() : chooseChat());
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
  // todo - perguntar telefone
  var newUser = User(
      name: stdin.readLineSync()!,
      age: DateTime.now(),
      phone: "44 999999999",
      wallet: Wallet());
  validateAge(newUser);
  return newUser;
}

addContact() {
  contactsTable.add(createUser("Nome do contato:"));
}

User chooseUser() {
  contactsTable.asMap().forEach((index, contact) {
    print("${index + 1} - ${contact.name}");
  });
  print("Qual contato?");
  try {
    return contactsTable[int.parse(stdin.readLineSync()!) - 1];
  } catch (e) {
    printError("Deve-se digitar somente números");
    rethrow;
  }
}

Chat chooseChat() {
  chatsTable.asMap().forEach((index, chat) {
    if (chat.isBlocked) {
      print("${index + 1} - \x1B[31m${chat.nickname}\x1B[0m ");
    } else {
      print("${index + 1} - ${chat.nickname}");
    }
  });
  print("Qual conversa?");
  try {
    return chatsTable[int.parse(stdin.readLineSync()!) - 1];
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
        sender: sender,
        chat: Chat(
          nickname: recipient.name,
          receivers: [recipient],
          isGroup: false,
        ),
        content: content,
        sendDate: DateTime.now());
  } catch (e) {
    printError("A mensagem não pode ser vazia");
    rethrow;
  }
}

sendMessage(Message message) {
  validateUserMessage(message.sender);
  messagesTable.add(message);
}

List<Message> getUserMessagesBetweenDates({required User user,
  required DateTime initDate,
  required DateTime endDate}) {
  return messagesTable
      .where((message) =>
  (message.sender == user &&
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
      chat: Chat(
        nickname: contact.name,
        receivers: [contact],
        isGroup: false,
      ),
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

generateData() {
  for (var i = 0; i < 10; i++) {
    contactsTable.add(User(
        id: contactsTable.length + 1,
        name: "Contato ${i + 1}",
        age: DateTime(2001),
        isPremium: false,
        phone: "44 999999999",
        wallet: Wallet()));

    chatsTable.add(Chat(
      id: chatsTable.length + 1,
      nickname: "Chat ${i + 1}",
      receivers: [contactsTable[0]],
      isGroup: false,
    ));
  }
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
        initDate:
        currentDate.subtract(Duration(hours: normalUserDefaultHourFilter)));

    if (userMessages.length > normalUserMaxMessages) {
      throw Exception("Você excedeu o máximo de mensagens!");
    }
  }
}

validateBlock(Chat chat) {
  if (chat.isBlocked) {
    if (yesOrNo("Esse contato já está bloqueado, deseja desbloquear?")) {
      var chatIndex = findChatIndexById(chat.id!);
      chatsTable[chatIndex].isBlocked = false;
    }
  }
}

//endregion

//region block chat

List<Chat> filterChatsBy({User? receiver, bool? isBlocked, bool? isGroup}) {
  List<Chat> filteredChats = chatsTable;

  if (isBlocked != null) {
    filteredChats.retainWhere((Chat chat) => chat.isBlocked == isBlocked);
  }
  if (isGroup != null) {
    filteredChats.retainWhere((Chat chat) => chat.isGroup == isGroup);
  }
  return filteredChats;
}

int findChatIndexById(int chatId) {
  var index = chatsTable.indexWhere((element) => element.id == chatId);
  if (index == -1) {
    throw Exception("Esse Chat não existe");
  }
  return index;
}

blockContact(Chat chat) {
  try {
    // validateBlockPrice(me,)
    validateBlock(chat);
    var chatIndex = findChatIndexById(chat.id!);
    chatsTable[chatIndex].isBlocked = true;
  } catch (e) {
    printError(e.toString());
  }
}

/// Regra de negócio:
/// O usuário só pode bloquear 3 chats de graça
/// a cada chat a ser bloqueado o valor do block sobe 3%
/// caso seja um user premium o valor é fixo
validateBlockPrice(User user, Function(double price) collectValue,
    { int maxBlocks = 3, double blockTaxPercentage = 10,
      double pricePerBlock = 30}) {
  List<Chat> blockedChats = filterChatsBy(isBlocked: true);
  if (blockedChats.length > maxBlocks) {
    double totalPrice;
    int overBlocks = blockedChats.length - maxBlocks;
    if (user.isPremium) {
      totalPrice = overBlocks * pricePerBlock;
    } else {
      totalPrice = overBlocks *
          (pricePerBlock + (pricePerBlock * blockTaxPercentage / 100));
    }
    collectValue(totalPrice);
  }
}


//endregion

//region criar grupo

bool yesOrNo(String question) {
  print("$question? (Y/N)");
  return stdin.readLineSync()?.toUpperCase() == "Y";
}

List<User> getListOfUser(Function getUserByFilter) {
  var contactsList = <User>[];
  while (true) {
    User contact = getUserByFilter();

    var contactIndexInList =
    contactsList.indexWhere((element) => element == contact);
    if (contactIndexInList != -1) {
      contactsList.removeAt(contactIndexInList);
    }

    contactsList.add(contact);
    if (yesOrNo("Deseja parar")) {
      break;
    }
  }
  return contactsList;
}

createGroup(List<User> contacts, {String groupName = "Novo Grupo"}) {
  Chat group = Chat(
      id: chatsTable.length + 1,
      nickname: groupName,
      receivers: contacts,
      isGroup: true);
  chatsTable.add(group);
}

// Transformada em função anônima
// createGroupInterface() {
//   List<User> contacts = getListOfUser(chooseUser);
//   print("Nome do grupo: ");
//   createGroup(contacts, groupName: stdin.readLineSync()!);
// }

//endregion
