import 'dart:io';
//  import 'dart:convert';
//  import 'package:intl/intl.dart';

void writeToDataLog(var input, [String? alternatePath]) {
  var file = new File(alternatePath ?? 'data.txt');
  file.writeAsStringSync('$input\n', mode: FileMode.append);
}

void readFromDataLog([String? alternatePath]) {
  var file = new File(alternatePath ?? 'data.txt');
  print(file.readAsLinesSync());
}

void main() {
  
  if (File('data.txt').exists()!=true) {
    File('data.txt');
  }

  print("What is your name?");
  String? name = stdin.readLineSync();
  print("Hello, ${name?.split(' ')[0]}!\nYour Name has been recorded!");
  writeToDataLog("$name");
  readFromDataLog();
}
