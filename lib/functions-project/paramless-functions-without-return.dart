import 'dart:io';
import 'package:aula01/functions-project/params-functions-without-return.dart'
    as params_functions_without_return;

show() {
  print("Teste2");
}

// 2 notas, calcular média e informar se está aprovado/reprovado
void verifyApprovation() {
  print("Nota 1:");
  var grade1 = double.parse(stdin.readLineSync()!);
  print("Nota 2:");
  var grade2 = double.parse(stdin.readLineSync()!);

  params_functions_without_return.printApprovation(25, grade2);
}

///WhatsApp 2

welcomeWpp2() {
  print("""Seja bem-vindo ao
 _       ____          __       ___                   ___ 
| |     / / /_  ____ _/ /______/   |  ____  ____     |__ \\
| | /| / / __ \\/ __ `/ __/ ___/ /| | / __ \\/ __ \\    __/ /
| |/ |/ / / / / /_/ / /_(__  ) ___ |/ /_/ / /_/ /   / __/ 
|__/|__/_/ /_/\\__,_/\\__/____/_/  |_/ .___/ .___/   /____/ 
                                  /_/   /_/""");

  print("""
  Você pode:
  
  1 ☄ Enviar mensagem
  2 ☄ Ação (como: tremer a tela, ligar e etc...)
  3 ☄ Outro
  """);

  switch (stdin.readLineSync()) {
    case "1":
      print("oi");
      break;
    case "2":
      print("oi");
      break;
    default:
      print("Saindo...");
      break;
  }
}
