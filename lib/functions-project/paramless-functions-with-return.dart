import 'dart:io';

show() {
  print("Teste4");
}



String returnApprovationString() {
  print("Nota 1:");
  var grade1 = double.parse(stdin.readLineSync()!);
  print("Nota 2:");
  var grade2 = double.parse(stdin.readLineSync()!);

  if (((grade1 + grade2) / 2) >= 6) {
    return """😒😒😒😭😭😭😭😭😭😒😒😒
    ___                                    __    
   /   |  ____  _________ _   ______ _____/ /___ 
  / /| | / __ \\/ ___/ __ \\ | / / __ `/ __  / __ \\
 / ___ |/ /_/ / /  / /_/ / |/ / /_/ / /_/ / /_/ /
/_/  |_/ .___/_/   \\____/|___/\\__,_/\\__,_/\\____/ 
      /_/                                        
😒😒😒😭😭😭😭😭😭😒😒😒                                      
    """;
  } else {
    return """🎉🎉🎉🥳🥳🥳🥳🥳🥳🎉🎉🎉
    ____                                       __    
   / __ \\___  ____  _________ _   ______ _____/ /___ 
  / /_/ / _ \\/ __ \\/ ___/ __ \\ | / / __ `/ __  / __ \\
 / _, _/  __/ /_/ / /  / /_/ / |/ / /_/ / /_/ / /_/ /
/_/ |_|\\___/ .___/_/   \\____/|___/\\__,_/\\__,_/\\____/ 
          /_/                                        
🎉🎉🎉🥳🥳🥳🥳🥳🥳🎉🎉🎉""";
  }
}

////////////////////////////////////////////////////////////////////////////////
