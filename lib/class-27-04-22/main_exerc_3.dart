void main() {
  print('\x1B[35m---------Exercício 01 - a)---------\x1B[0m');
  /// Exercício 01 - implemente as funções
  /// a) Função que solicite um número e realizar validações: (1) se é par; (2) maior que zero; (3) se é um número primo.
  /// função "hospedeira" : solicitar um número

  //(1)
  validateNumber(10, (int value) => value.isEven);

  //(2)
  validateNumber(10, (int value) => !value.isNegative);

  //(3)
  validateNumber(10, isPrime);

  print('\x1B[35m---------Exercício 01 - b)---------\x1B[0m');
  /// b) Função que solicite a data inicial e retorne quanto tempo passou em: (1) anos; (2) dias; e (3) horas.
  printTime(DateTime.now().subtract(Duration(days: 9000)), DateTime.now(),
      (DateTime initDate, DateTime endDate) {
    // var year0 = DateTime(0);
    // year0.add(Duration(days: initDate.difference(endDate).inDays));
    return "A diferença em anos é de ${(endDate.difference(initDate).inDays / 365).toStringAsFixed(2)}";
  });

  printTime(DateTime.now().subtract(Duration(days: 500)), DateTime.now(),
      (DateTime initDate, DateTime endDate) {
    return "A diferença em dias é de ${endDate.difference(initDate).inDays}";
  });

  printTime(DateTime.now().subtract(Duration(days: 50)), DateTime.now(),
      (DateTime initDate, DateTime endDate) {
    return "A diferença em horas é de ${endDate.difference(initDate).inHours}";
  });

  print('\x1B[35m---------Exercício 01 - c)---------\x1B[0m');
  /// c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salário para: (1) auxiliar; (2) junior; e (3) pleno.
  ///
  /// (1) auxiliar: 6 horas diárias de trabalho e não pode fazer hora extra
  /// (2) junior: 8 horas diárias de trabalho e trabalha aos sábados recebendo 0.5x
  /// a mais do salário por hora no 6° dio de trabalho (sábado)
  /// (3) pleno: 8 horas diárias de trabalho, trabalha aos sábados e a cada 30 dias
  ///  recebe uma bonificação em dinheiro de 0.7x baseado no salário mensal
  workedHours((int workedDays, double hourWage, WorkerRole role) {
    switch (role) {
      case WorkerRole.auxiliar:
        return (hourWage * 6) * workedDays;
      case WorkerRole.junior:
        var wageOfADay = (hourWage * 8);
        if (workedDays >= 6) {
          var workedSats = workedDays / 6;
          var workingDays = workedDays - workedSats;
          return (wageOfADay * workingDays) + ((workedSats * wageOfADay) * 1.5);
        } else {
          return wageOfADay * workedDays;
        }
      case WorkerRole.pleno:
        var wageOfADay = (hourWage * 8);
        if (workedDays >= 24) {
          var workedMonths = workedDays / 24;
          var monthWage = 24 * wageOfADay;
          return (wageOfADay * workedDays) + ((monthWage * workedMonths) * 1.7);
        } else {
          return wageOfADay * workedDays;
        }
    }
  }, hourWage: 5.5, workedDays: 6, role: WorkerRole.junior);

  /// Exercício 02 - para cada função "hospedeira", defina uma função anônima.
}

//region Exercício 01 - a)
bool isPrime(int value) {
  for (var i = 2; i <= value / i; ++i) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}

validateNumber(int value, Function(int value) validate) {
  bool isValid = validate(value);
  print(isValid ? "Valido" : "Inválido");
}
//endregion

//region Exercício 01 - b)
printTime(
    DateTime initDate, DateTime endDate, Function(DateTime initDate, DateTime endDate) validate) {
  String dateDifference = validate(initDate, endDate);
  print(dateDifference);
}

//endregion

//region Exercício 01 - c)
workedHours(Function(int workedDays, double hourWage, WorkerRole role) calcSalary,
    {required int workedDays, required double hourWage, required WorkerRole role}) {
  double fullSalary = calcSalary(workedDays, hourWage, role);
  print("O salário total do ${role.name} é de R\$${fullSalary.toStringAsFixed(2)}");
}

enum WorkerRole {
  auxiliar,
  junior,
  pleno,
}

//endregion
