import 'package:projeto_avancado_software_ifpr2022/class-18-05-22/aprovacao_nota.dart';
import 'package:projeto_avancado_software_ifpr2022/class-27-04-22/main_exerc_2.dart';
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
}
