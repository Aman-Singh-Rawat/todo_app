import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo_item.dart';
import 'package:to_do_app/pages/task_page.dart';
import 'package:to_do_app/pages/tasks_list_item.dart';

import '../util/items_list.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {

  removeTasks(TodoItem item) {
    setState(() {
      items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 147, 149, 211).withOpacity(0.3),
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return TasksListItem(
                todoItem: items[index],
                removeTasks: removeTasks,
                updateTask: updateTasks,
              );
            },
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskPage(
                  "ADD_PAGE",
                  addTasks: addTasks,
                ),
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: const Color.fromARGB(255, 147, 149, 211),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
