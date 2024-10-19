import '../model/todo_item.dart';

List<TodoItem> items = [
  TodoItem(taskName: "First Task", description: "Kux V"),
  TodoItem(taskName: "Second Task", description: "Kux V"),
  TodoItem(taskName: "Third Task", description: "Kux V"),
  TodoItem(taskName: "Fourth Task", description: "Kux V"),
  TodoItem(taskName: "Fifth Task", description: "Kux V"),
  TodoItem(taskName: "Sixth Task", description: "Kux V"),
  TodoItem(taskName: "Seven Task", description: "Kux V"),
  TodoItem(taskName: "Eight Task", description: "Kux V"),
  TodoItem(taskName: "Nine Task", description: "Kux V"),
];

List<TodoItem> updatedItems = [];

addTasks(TodoItem item) {
  items.add(item);
}

completedTasks(TodoItem item) {
  updatedItems.add(item);
}

updateTasks(TodoItem item) {
  updatedItems.add(item);
}
