class Task {
  String? title;
  String? description;
  dynamic dueDate = DateTime.now();
  bool status = false;

  Task(this.title, this.description);
}
