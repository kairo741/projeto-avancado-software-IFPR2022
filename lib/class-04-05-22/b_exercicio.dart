import 'package:projeto_avancado_software_ifpr2022/class-04-05-22/ver_aprovacao/verificar_aprovacao.dart'
    as aprovacao;

String show() {
  var nota1 = 7.0;
  var nota2 = 8.0;
  var media = 9000.0;
  var quantidadePresenca = 70;
  var cargaHorariaDisciplina = 80;
  var percentualMinimoPresenca = 100.0;
  return aprovacao.verificarAprovacao(
      nota1, nota2, media, quantidadePresenca, cargaHorariaDisciplina, percentualMinimoPresenca);
}

/*
Esta função tem o objetivo de verificar a aprovação pela nota e presença
Considerando este cenário, quais são os possíveis contextos de teste?
Para cada cenário, os resultados gerados estão coerentes?
Registros os erros encontrados e faça as alterações necessárias.
*/
