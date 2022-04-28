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
  /// c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
  /// Exercício 02 - para cada função "hospedeira", defina uma função anônima.
}

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
