import 'package:projeto_avancado_software_ifpr2022/class-04-05-22/ver_aprovacao/calculo_nota.dart'
    as nota;
import 'package:projeto_avancado_software_ifpr2022/class-04-05-22/ver_aprovacao/calculo_presenca.dart'
    as presenca;

String verificarAprovacao(double nota1, double nota2, double media, int quantidadePresenca,
    int cargaHorariaDisciplina, double percentualMinimoPresenca) {
  var aprovadoNota = verificarAprovacaoNota(nota1, nota2, media);
  var aprovadoPresenca = verificarAprovacaoPresenca(
      quantidadePresenca, cargaHorariaDisciplina, percentualMinimoPresenca);
  var resultado = '\x1B[32mAprovado\x1B[0m';
  if (!aprovadoNota) {
    resultado = '\x1B[31mReprovado por nota\x1B[0m';
  }
  if (!aprovadoPresenca) {
    resultado = '\x1B[31mReprovado por presença\x1B[0m';
  }
  if(!aprovadoNota && !aprovadoPresenca){
    resultado = '\x1B[31mReprovado por nota e por presençakkkkkkkkkkkkkkkkkkk\x1B[0m';
  }

  return resultado;
}

bool verificarAprovacaoNota(double nota1, double nota2, [double media = 6]) {
  return (nota.calcularMedia(nota1, nota2) >= media);
}

bool verificarAprovacaoPresenca(
    int quantidadePresenca, int cargaHorariaDisciplina, double percentualMinimoPresenca) {
  return (presenca.calcularPercentualPresenca(quantidadePresenca, cargaHorariaDisciplina) >
      percentualMinimoPresenca);
}
