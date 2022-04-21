/// {op 1} Aprovação pela média
/// {op 2} Aprovação pela maior nota
/// {op 3} Aprovação pela menor nota

//Qual a diferença do verfifyCompleteApprovalByOption para o verfifyCompleteApprovalByFunc?
//R: O método verfifyCompleteApprovalByFunc, é mais maleavel e te permite acoplar funções para serem
// executadas com os parametros enviados

String verfifyCompleteApprovalByOption(int option, double grade1, double grade2) {
  var result = "";
  switch (option) {
    case 1: // Aprovação pela média
      result = _wasDisapproved((grade1 + grade2) / 2);
      break;

    case 2: // Aprovação pela maior nota
      result = _verfifyApprovalByLargest(grade1, grade2);
      break;

    case 3: // Aprovação Pela menor nota
      result = _verfifyApprovalByTiniest(grade1, grade2);
      break;

    default:
      print("Tipo inválido");
      break;
  }
  return result;
}

String verfifyCompleteApprovalByFunc(double grade1, double grade2, Function function) {
  return function(grade1, grade2);
}

String _wasDisapproved(double finalGrade) {
  return finalGrade >= 6 ? "Aprovado" : "Reprovado";
}

String _verfifyApprovalByLargest(double grade1, double grade2) {
  return _wasDisapproved((grade2 > grade1) ? grade1 : grade2);
}

String _verfifyApprovalByTiniest(double grade1, double grade2) {
  return _wasDisapproved((grade2 < grade1) ? grade2 : grade1);
}

void show() {
  print("lib/ anonymous-functions/anon-funcs.dart");
  // verfifyCompleteApprovalByFunc(6, 2, _verfifyApprovalByLargest);

  /// Arrow/Anonymous Functions são geralmente utilizadas em escopos fechados do projeto
  /// onde aquela função será utilizada somente uma vez
  /// é bem comum ser vista em bibliotecas, onde o criador da biblioteca deixa
  /// para o programador definir o que fazer
  print(verfifyCompleteApprovalByFunc(
      6, 2, (double grade1, double grade2) => _wasDisapproved((grade1 + grade2) / 2)));
}
