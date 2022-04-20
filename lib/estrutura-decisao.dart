import 'dart:io';

faltas() {
  stdout.write("Digite a quantidade de faltas: ");

  var input = int.tryParse(stdin.readLineSync()!);

  input! >= 200
      ? print("Parabéns, vc passou!")
      : print("Parabéns, vc reprovou!");
}

compararNotas() {
  var notas = <int>[];

  for (var i = 0; i < 3; i++) {
    stdout.write("Digite a nota N° ${i + 1}: ");
    notas.add(int.parse(stdin.readLineSync()!));
  }

  notas.sort(); // ou isso

  // var temp = notas.first;
  // notas.forEach((element) {
  //   if(element > temp){
  //
  //   }
  //
  // });

  print("Notas da menor a maior: $notas");
}

imprimirNumeros() {
  //4 //3*9 //31
  for (var i = 5; i <= 95; i += 10) {
    print(i);
  }
}

imprimirListas() {
  var listaNumeros = [];

  for (var i = 5; i <= 95; i += 10) {
    listaNumeros.add(i);
  }

  print("/////////////////////// ForEach ///////////////////////");
  listaNumeros.forEach(print);

  print("/////////////////////// For ///////////////////////");
  for (var element in listaNumeros) {
    print(element);
  }

  print("/////////////////////// While ///////////////////////");
  var contador = 0;
  while (contador < listaNumeros.length) {
    print(listaNumeros[contador]);
    contador++;
  }
}
