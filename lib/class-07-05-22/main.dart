main() {
  ///01) O que é e para que serve o tratamento de erros?
// O tratamento de erros são formas para contornar/criar uma resposta
// para exceções que são eventos indesejados em tempo de execução
// que interrompem o fluxo de execução do código.

  ///02) Quais são as formas de tratamentos de erros?
// Além das formas simples como if else, há formas nativas no Dart, como o try/catch

  ///03) Qual a diferença entre erro e exceção?
//Erro é uma condição crítica que não pode ser tratada pelo código do programa.
// Exceção é a situação excepcional que pode ser tratada pelo código do programa.
// A diferença significativa entre erro e exceção é que um erro é causado devido à
// falta de recursos do sistema e uma exceção é causada por causa de seu código.

  ///04) Qual a diferença entre exceção implícita (contornável) e explícita (incontornável)?

  ///05) O que são: (1) throwables; (2) Checked Exception; e (3) Unchecked (Runtime)?
// Throwables são exceptions "lançadas" pelo código como por um throws
// As exceções Checked são aquelas no qual você é obrigado a tratá-la, seja com um bloco
// try/catch ou mesmo com um throws (relançando a mesma para outro local).
// Por outro lado, quando você tem exceções do tipo Unchecked não é obrigatório o tratamento
// da mesma, você pode tratar apenas se quiser, se sentir que é necessário para o
// bom funcionamento da sua aplicação.

  ///06) Quais são os tratamentos de erros existentes no Dart?
// Existem palavras reservadas para "cuidar" do tratamento de erros como
// try/catch, on, finally, rethrow, etc

  ///07) Quais são as principais exceções existentes no Dart?
// DefferedLoadException; FormatException; IntegerDivisionByZeroException;
// IOEException; IsolateSpawnException e Timeout.

  ///08) O que é e como funciona o try/catch? Em que caso devemos utilizar? Há uma camada da aplicação correta em utilizá-lo? Exemplifique.
// a parte do Try executa como "teste" um bloco de código, caso aconteça uma exceção
// ignora o que aconteceu no bloco de código e executa a parte do Catch que também
// executa um bloco de código após a exceção, recebendo por parâmetro a exceção
// Devemos utilizar em casos onde exceções podem afetar negativamente a funcionalidade do sistema
  try {
    var teste = int.parse("abc");
  } catch (e) {
    print(e);
  }

  ///09) O que é e como funciona o on e final no tratamento de erros? Em que caso devemos utilizar? Há uma camada da aplicação correta em utilizá-lo? Exemplifique.
  // O finally é utilizado para definição de códigos que sempre devem ser executados independente
  // se aconteça ou não uma exceção; já o on é utilizado para definir o tratamento de uma exceção em específico
  try {
    var teste = int.parse("abc");
  } on FormatException {
    print("Aconteceu uma FormatException");
  } catch (e) {
    print(e);
  } finally {
    print("Código que sempre será executado");
  }

  ///10) O que é e como funciona o rethrow? Em que caso devemos utilizar? Exemplifique.
  // rethrow é utilizado para que após o tratamento da exception o catch ainda sim
  // ele "retorne" para um try/catch superior ao que tratou o erro que aconteceu uma exception
  try {
    try {
      var teste = int.parse("abc");
    } catch (e) {
      print("Exception dentro do 1° try/catch $e");
      rethrow;
    }
  } catch (e) {
    print("Exception dentro do 2° try/catch  $e");
  }

  ///11) No try/catch, o que é captura de erros? Como é realizada - sintaxe? Quais são os tipos de capturas possíveis? Quais são as diferenças?

  ///12) Explique e exemplifique o uso das cláusulas on e finally no bloco try-cath.
  try {
    var teste = int.parse("abc");
  } on FormatException {
    print("Aconteceu uma FormatException");
  } catch (e) {
    print(e);
  } finally {
    print("Código que sempre será executado");
  }

  ///13) É possível criar exceções específicas? Se sim, em que caso podem ser utilizas? Quais são os cuidados que devemos ter. Exemplifique.
  // Sim, geralmente são utilizadas para receberem um tratamento diferente baseado no tipo da Exceção

  ///14) Implemente o try-catch (com relevância) nas funções do seu projeto – pelo menos 5 funções. Faça o tratamento de erro específico e geral.
  // Implementado em lib/whats-app-2/main.dart

  ///15) Analise o seu projeto e crie exceções específicas que facilite a localização e a manutenção do projeto.
  //  // Implementado em lib/whats-app-2/main.dart

  ///16) O que é e para que serve o Either? Qual a relação e qual a diferença com o try-cath? Faça um exemplo no contexto do seu projeto.
}
