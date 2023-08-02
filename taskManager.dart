import 'task.dart';
import 'dart:io';

List<Task> tasks = [];

class TaskManager {
  // TaskManager();
  // Adds new task
  static void addNewTask() {
    String? title = getInput("title");
    String? description = getInput("description");
    Task newTask = Task(title, description);
    tasks.add(newTask);
  }

  static List viewAllTasks() {
    List<List> T = [];
    int i = 0;
    for (i == 0; i < tasks.length; i++) {
      var stat = getStat(tasks[i]);

      String? date = getDate(tasks[i].dueDate);
      print("$i ${tasks[i].title} ${tasks[i].description} ${date} $stat");
      String val = "$i ${tasks[i].title} ${tasks[i].description} ${date} $stat";
      List<String> text = val.split(" ");
      T.add(text);
    }
    return T;
  }

  static String? getStat(task) {
    var stat;
    if (task.status) {
      stat = "Completed";
    } else {
      stat = "Pending";
    }
    return stat;
  }

  static String? getDate(dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    int day = dateTime.day;

    return 'yyyy/mm/dd:$year/$month/$day';
  }

  static void viewCompletedTasks() {
    var completedTask;
    for (completedTask in tasks) {
      if (completedTask.status) {
        String? date = getDate(completedTask.dueDate);
        var status = getStat(completedTask);
        print(
            "${completedTask.title}, ${completedTask.description}, ${date}, ${status}");
      }
    }
  }

  static void viewPendingTasks() {
    var pendingTask;
    for (pendingTask in tasks) {
      if (pendingTask.status != true) {
        String? date = getDate(pendingTask.dueDate);
        var status = getStat(pendingTask);
        print(
            "${pendingTask.title}, ${pendingTask.description}, ${date}, ${status}");
      }
    }
  }

  static void editTask() {
    List ans = TaskManager.viewAllTasks();
    int t = chooseTasktoBeEdited();
    print(ans[t]);
    int number = taskEditingChoice();

    if (number == 1) {
      var editingText = getInput("new title");
      ans[t][number] = editingText;
      tasks[t].title = editingText;
    } else if (number == 2) {
      var editingText = getInput("new description");
      ans[t][number] = editingText;
      tasks[t].description = editingText;
    } else if (number == 4) {
      var editingText = getInput("1 to mark completed, 0 for pending");
      int boolean = int.parse(editingText!);
      if (boolean == 1) {
        ans[t][number] = "Completed";
        tasks[t].status = true;
      } else {
        ans[t][number];
      }
    }

    print(ans[t]);
  }
}
////////////////////////////////////////////////////////////////////////////////

String? getInput(String arg) {
  print("write $arg");
  String? input = stdin.readLineSync();
  return input;
}

int chooseTasktoBeEdited() {
  print("\ninsert the desired number to edit that task");
  String? number = getInput("Your prefered number");
  int choice = int.parse(number!);
  return choice;
}

int taskEditingChoice() {
  print("\nType 1 to edit title\nType 2 to edit description");
  print("Type 4 to edit status\n");
  String? number = getInput("Your prefered number");
  int choice = int.parse(number!);
  return choice;
}
