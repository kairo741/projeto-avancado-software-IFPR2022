import 'dart:io';
import 'package:projeto_avancado_software_ifpr2022/functions-project/params-functions-without-return.dart'
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

