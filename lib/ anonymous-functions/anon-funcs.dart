/// {op 1} Aprovação pela média
/// {op 2} Aprovação pela maior nota
/// {op 3} Aprovação pela menor nota

String verfifyCompleteApproval(int option, double grade1, double grade2) {
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

String _wasDisapproved(double finalGrade) {
  return finalGrade >= 6 ? "Aprovado" : "Reprovado";
}

String _verfifyApprovalByLargest(double grade1, double grade2) {
  var largestGrade = grade1;
  if (grade2 > grade1) largestGrade = grade2;
  return _wasDisapproved(largestGrade);
}

String _verfifyApprovalByTiniest(double grade1, double grade2) {
  var tiniestGrade = grade1;
  if (grade2 < grade1) tiniestGrade = grade2;
  return _wasDisapproved(tiniestGrade);
}

void show() {
  print("lib/ anonymous-functions/anon-funcs.dart");
}
