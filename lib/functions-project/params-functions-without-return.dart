import 'dart:io';

show() {
  print("Teste3");
}

///Atividade I
///→ descontar - receber salario e o valor do desconto. Realizar o cálculo e informar se o total é positivo.
void discount(double discount, double salary) {
  (salary - discount).isNegative
      ? print("Vish amigão, só mês que vem ein... Saldo insuficiente!")
      : print(
      "Após o desconto há o total de ${(salary - discount)} de salário!");
}


printApprovation(double grade1, double grade2) {
  if (((grade1 + grade2) / 2) >= 6) {
    print("""😒😒😒😭😭😭😭😭😭😒😒😒
    ___                                    __    
   /   |  ____  _________ _   ______ _____/ /___ 
  / /| | / __ \\/ ___/ __ \\ | / / __ `/ __  / __ \\
 / ___ |/ /_/ / /  / /_/ / |/ / /_/ / /_/ / /_/ /
/_/  |_/ .___/_/   \\____/|___/\\__,_/\\__,_/\\____/ 
      /_/                                        
😒😒😒😭😭😭😭😭😭😒😒😒                                      
    """);
  } else {
    print("""🎉🎉🎉🥳🥳🥳🥳🥳🥳🎉🎉🎉
    ____                                       __    
   / __ \\___  ____  _________ _   ______ _____/ /___ 
  / /_/ / _ \\/ __ \\/ ___/ __ \\ | / / __ `/ __  / __ \\
 / _, _/  __/ /_/ / /  / /_/ / |/ / /_/ / /_/ / /_/ /
/_/ |_|\\___/ .___/_/   \\____/|___/\\__,_/\__,_/\\____/ 
          /_/                                        
🎉🎉🎉🥳🥳🥳🥳🥳🥳🎉🎉🎉""");
  }
}

///Atividade II
///Pensar em um projeto único
///Fazer um exemplo seu
///Fazer comentários de tudo que entendeu
/// FAREI O WHATSAPP 2






