import 'dart:io';
import 'dart:math';
import 'package:enough_ascii_art/enough_ascii_art.dart' as art;


executar() async {
  print("Tipos de variáveis");

  var nomeProduto = "Lacka";
  var tipoProduto = "Chocolate";
  var precoProduto = 3.49;
  var qntdProduto = 5;

  print("$qntdProduto unidades de $tipoProduto $nomeProduto custam ${(precoProduto * qntdProduto).toStringAsFixed(2)} ");
  stdout.write("Digite seu nome: ");



  var input = stdin.readLineSync(retainNewlines: false);

  print("❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤ Olá $input seu little $tipoProduto ❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤");


  List<String> fontes = ['big.flf', 'avatar.flf', 'henry3d.flf', 'colossal.flf'];

  var fontText = await File('lib/figlet-fonts/' + fontes[Random().nextInt(fontes.length)]).readAsString();
  var figure = art.renderFiglet(input!, art.Font.text(fontText));
  print(figure);

}
