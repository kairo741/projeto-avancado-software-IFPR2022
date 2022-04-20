import 'dart:io';

import 'package:projeto_avancado_software_ifpr2022/functions-project/models/user.dart';

import 'models/message.dart';

show() {
  print("Teste4");
}

String returnApprovationString() {
  print("Nota 1:");
  var grade1 = double.parse(stdin.readLineSync()!);
  print("Nota 2:");
  var grade2 = double.parse(stdin.readLineSync()!);

  if (((grade1 + grade2) / 2) >= 6) {
    return """😒😒😒😭😭😭😭😭😭😒😒😒
    ___                                    __    
   /   |  ____  _________ _   ______ _____/ /___ 
  / /| | / __ \\/ ___/ __ \\ | / / __ `/ __  / __ \\
 / ___ |/ /_/ / /  / /_/ / |/ / /_/ / /_/ / /_/ /
/_/  |_/ .___/_/   \\____/|___/\\__,_/\\__,_/\\____/ 
      /_/                                        
😒😒😒😭😭😭😭😭😭😒😒😒                                      
    """;
  } else {
    return """🎉🎉🎉🥳🥳🥳🥳🥳🥳🎉🎉🎉
    ____                                       __    
   / __ \\___  ____  _________ _   ______ _____/ /___ 
  / /_/ / _ \\/ __ \\/ ___/ __ \\ | / / __ `/ __  / __ \\
 / _, _/  __/ /_/ / /  / /_/ / |/ / /_/ / /_/ / /_/ /
/_/ |_|\\___/ .___/_/   \\____/|___/\\__,_/\__,_/\\____/ 
          /_/                                        
🎉🎉🎉🥳🥳🥳🥳🥳🥳🎉🎉🎉""";
  }
}

////////////////////////////////////////////////////////////////////////////////

Message createMessage() {
  print("Quem é o você?");
  var sender = User(name: stdin.readLineSync()!);

  print("Quem ?");


  print("Quem irá receber?");
  var recipient = User(name: stdin.readLineSync()!);

  return Message(user: sender, content: "content", type: MessageType.TEXT); // todo - alterar
}
