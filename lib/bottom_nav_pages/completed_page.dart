import 'package:flutter/cupertino.dart';
import 'package:to_do_app/model/todo_item.dart';

import '../pages/tasks_list_item.dart';
import '../util/items_list.dart';

class CompletedPage extends StatelessWidget {
  CompletedPage({super.key});

  Widget mainItem = Center(child: Image.asset("assets/images/empty.gif"),);

  removeTasks(TodoItem item) {
    updatedItems.remove(item);
  }

  @override
  Widget build(BuildContext context) {
    List<TodoItem> item = updatedItems;
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: item.isEmpty
          ? mainItem
          : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return TasksListItem(
                  updateTask: (TodoItem updatedItem) => updateTasks(
                    updatedItem,
                  ),
                  removeTasks: removeTasks,
                  todoItem: updatedItems[index],
                );
              },
            ),
    );
  }
}
