import 'dart:io';
import 'package:cli_dialog/cli_dialog.dart';
import 'package:ansi_styles/extension.dart';

String clearTerminalCode = "\x1B[2J\x1B[0;0H";

void writeToDataLog(var input, [String? alternatePath]) {
  var file = new File(alternatePath ?? 'data.txt');
  file.writeAsStringSync('$input\n', mode: FileMode.append);
}

List<String> readFromDataLog([String? alternatePath]) {
  var file = new File(alternatePath ?? 'data.txt');
  return file.readAsLinesSync();
}

//[
void removeLineFromDataLog(int index, [String? alternatePath]) {
  File file = new File(alternatePath ?? 'data.txt');
  List<String> lines = file.readAsLinesSync();
  lines.removeAt(index);
  final newTextData = lines.join('\n');
  file.writeAsStringSync(newTextData);
}

//]
void main() {
  if (File('data.txt').exists() != true) {
    File('data.txt');
  }

  List listQuestions = [
    [
      {
        'question': 'Would You like to Read or Write to the TODO List?',
        'options': ['Read', 'Write', 'Remove Items', 'Exit']
      },
      'userAction'
    ]
  ];

  final dialog = CLI_Dialog(listQuestions: listQuestions);
  while (true) {
    print(clearTerminalCode);
    final answer = dialog.ask();

    final String userAction = answer['userAction'];

    if (userAction.toLowerCase() == 'exit') {
      exit(0);
    } else if (userAction.toLowerCase() == 'read') {
      print(clearTerminalCode);
      List<String> dataLogLines = readFromDataLog();
      dataLogLines.forEach((String line) => print("  $line"));
      sleep(Duration(seconds: 1));
    } else if (userAction.toLowerCase() == 'write') {
      print(clearTerminalCode);
      String? todoItem = CLI_Dialog(questions: [
        ['What is the TODO Item?', 'todoItem']
      ]).ask()['todoItem'];

      writeToDataLog(todoItem);
    } else if (userAction.toLowerCase() == 'remove items') {
      print(clearTerminalCode);
      List<String> todoItemList = readFromDataLog();

      if (todoItemList.length > 0) {
        List<String> optionsList = todoItemList;
        optionsList.add('*Exit*');
        List questions = [
          [
            {
              'question': 'What item would you like to remove?',
              'options': optionsList
            },
            'deleteSelection'
          ]
        ];
        var answers = new CLI_Dialog(listQuestions: questions).ask();
        print(answers['deleteSection']);
        if (answers['deleteSelection'] != '*Exit*') {
          int indexOfDeletedItem = todoItemList.indexOf(answers['deleteSelection']);
          removeLineFromDataLog(indexOfDeletedItem);
        }
      } else {
        print("There are no items, silly!".bold);
        sleep(Duration(seconds: 1));
      }
    }
  }
}
