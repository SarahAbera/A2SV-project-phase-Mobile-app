// import 'task.dart';
import 'taskManager.dart';
import 'dart:io';

void main() {
  print("""
    Type 1 to add new tasks\n
    Type 2 to view all tasks\n
    Type 3 to view completed tasks\n
    Type 4 to view pending tasks\n
    Type 5 to edit task\n
    Type 6 to exit\n
""");
  while (true) {
    String? input = stdin.readLineSync();
    int n = int.parse(input!);
    switch (n) {
      case 1:
        TaskManager.addNewTask();
        break;
      case 2:
        TaskManager.viewAllTasks();
        break;
      case 3:
        TaskManager.viewCompletedTasks();
        break;
      case 4:
        TaskManager.viewPendingTasks();
        break;
      case 5:
        TaskManager.editTask();
        break;
      case 6:
        exit(0);
      default:
        print('Invalid input. Please enter a number between 1 and 6.');
        break;
    }
  }
}
