import 'dart:io';

/// Atividade II - Defina 3 funções do mesmo contexto e uma interface para estas funções
///
/// → função para escolha das funções do Salário
/// → Receber salario e um valor. Bonificar e retornar o valor do salário.
/// → Receber salario e um valor. Descontar e retornar o valor do salário.
/// → Receber salario e um valor. Neste caso o valor é o bônus que tem encargos de 10%.
/// Adicionar o bônus e retornar o valor do salário.
///
/// Atividade III
/// Pensar em um projeto único
/// Fazer um exemplo seu

const String menu = """
1 → Receber salário e um valor. Bonificar e retornar o valor do salário.
2 → Receber salário e um valor. Descontar e retornar o valor do salário.
3 → Receber salário e um valor. Neste caso o valor é o bônus que tem encargos de 10%.
""";

void show() {
  print(menu);
  var option = int.parse(stdin.readLineSync()!);
  switch (option) {
    case 1:
      operateSalary((double salary, double bonus) => salary + bonus);
      break;
    case 2:
      operateSalary((double salary, double bonus) => salary - bonus);
      break;
    case 3:
      operateSalary(chargesFromBonusToSalary);
      break;
    default:
      print("Opção inválida");
      break;
  }
}

operateSalary(Function function) {
  print("Digite o salário: ");
  var salary = double.parse(stdin.readLineSync()!);
  print("Digite o bônus/desconto: ");
  var bonus = double.parse(stdin.readLineSync()!);

  //Utiliza a função recebida por parametro
  salary = function(salary, bonus);
  print("O novo salário é: $salary");
}

double chargesFromBonusToSalary(double salary, double bonus) {
  print("Digite a porcentagem: ");
  var chargesPercent = double.parse(stdin.readLineSync()!);

  return (salary + (bonus - (bonus * (chargesPercent / 100))));
}

/// As funções foram substituidas por arrow functions
// double bonusSalary(double salary, double bonus) {
//   return salary + bonus;
// }
//
// double deductSalary(double salary, double bonus) {
//   return salary - bonus;
// }
