import 'dart:core';

void main() {
  // Atividade II → Realize as atividades abaixo
  double salario = 200;
  double valor = 50;
  double negativeValor = -50;

  ///Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.
  adicionarSalario(salario, valor, ePositivo);
  adicionarSalario(salario, negativeValor, ePositivo);

  ///Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.
  adicionarSalario(salario, valor, ((double valor) {
    return !valor.isNegative;
  }));
  adicionarSalario(salario, negativeValor, ((double valor) {
    return !valor.isNegative;
  }));

  ///Exercício 3  - refaça o exe anterior, utilizando a arrow function.
  adicionarSalario(salario, valor, ((double valor) => !valor.isNegative));
  adicionarSalario(salario, negativeValor, ((double valor) => !valor.isNegative));

  ///Exercício 4  - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.

  // função nomeada - não é possível sem alterar a função adicionarSalario
  // adicionarSalario(salario, negativeValor, isMenor);

  // ||anom|| func
  adicionarSalario(salario, negativeValor, (double valor) {
    return valor < salario;
  });

  // => func
  adicionarSalario(salario, negativeValor, (double valor) => valor < salario);

  ///Exercício 5  - refaça o exe c porém fazendo uma validação sua.
  // valido se o salário aumentou mais que o dobro
  adicionarSalario(salario, valor, (double valor) => (valor + salario >= salario * 2));

  ///Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.
  ["Kairo", "João", "Cristian", "Rafael"].forEach(print);

  var filteredLangs =
      ["Java", "Dart", "TypeScript", "JavaScript"].where((element) => element.length < 6);
  print(filteredLangs);


  ///Exercício 6 - Conseguiu entender:
  ///  - O contexto em que é útil utilizar funções anônimas?
  ///  - Os requisitos necessários para usar funções anônimas?
  ///  - diferença entre função nomeada e anônimas?
  ///  - diferença entre anonymous function e arrow function?
  ///  Em que caso devemos utilizar Arrow Function? O que devemos considerar?
}

void adicionarSalario(double salario, double valor, Function(double valor) validacao) {
  final eValido = validacao(valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  } else {
    print("Inválido");
  }
}

bool isMenor(double valor) {
  return valor.isNegative;
}

bool ePositivo(double numero) {
  if (numero > 0) {
    return true;
  } else {
    return false;
  }
}
