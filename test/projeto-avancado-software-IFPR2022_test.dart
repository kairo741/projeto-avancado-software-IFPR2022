import 'package:projeto_avancado_software_ifpr2022/class-18-05-22/aprovacao_nota.dart';
import 'package:projeto_avancado_software_ifpr2022/class-27-04-22/main_exerc_2.dart';
import 'package:projeto_avancado_software_ifpr2022/whats-app-2/main.dart';
import 'package:projeto_avancado_software_ifpr2022/whats-app-2/models/user.dart';
import 'package:test/test.dart';

main() {
  test('teste calcular média', () {
    expect(calcularMedia(nota1: 1, nota2: 3), 2.0);
  });

  group('testes validando as notas', () {
    test('gerar exception com números negativos', () {
      expect(() => validarNota(nota1: -50, nota2: -50), throwsException);
    });

    test('gerar exception com números negativos', () {
      expect(ePositivo(2), true);
    });
  });

  group('Teste do Wpp 2 - Validar Idade', () {
    test("Gerar exceptions para menores de 13 anos", () {
      expect(() => validateAge(User(name: "Teste", age: DateTime(2015))), throwsException);
    });

    test("Aceitar maiores de 13 anos", () {
      expect(() => validateAge(User(name: "Teste", age: DateTime(1975))), returnsNormally);
    });

    test("Valores inválidos para idade", () {
      expect(() => validateAge(User(name: "Teste", age: DateTime(2040))), throwsException);
    });

    test("Idade superior a 120", () {
      expect(() => validateAge(User(name: "Teste", age: DateTime(205))), throwsException);
    });
  });
}
