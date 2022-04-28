void main() {
  /// Exercício 01 - implemente as funções
  /// a) Função que solicite um número e realizar validações: (1) se é par; (2) maior que zero; (3) se é um número primo.
  /// função "hospedeira" : solicitar um número

  //(1)
  validateNumber(10, (int value) => value.isEven);

  //(2)
  validateNumber(10, (int value) => !value.isNegative);

  //(3)
  validateNumber(10, isPrime);

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

  /// c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
  workedHours(10, 200, (int workedDays, double hourWage){
    int hours = workedDays * 8;
  });
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
workedHours(
    int workedDays, double hourWage, Function(int workedDays, double hourWage) calcSalary) {
  double fullSalary = calcSalary(workedDays, hourWage);
  print(fullSalary);
}

//endregion