import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/model/todo_item.dart';
import 'package:to_do_app/pages/add_update_button.dart';
import 'package:to_do_app/pages/task_page.dart';
import 'package:to_do_app/util/formatter_date_time.dart';
import 'package:to_do_app/util/items_list.dart';

class TasksListItem extends StatefulWidget {
  TasksListItem({
    required this.updateTask,
    required this.removeTasks,
    required this.todoItem,
    super.key,
  });

  TodoItem todoItem;
  Function removeTasks;
  Function updateTask;

  @override
  State<TasksListItem> createState() {
    return _TasksListItemState();
  }
}

class _TasksListItemState extends State<TasksListItem> {
  bool isChecked = false;

  changeState(value) async {
    setState(() {
      isChecked = true;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      widget.removeTasks(widget.todoItem);
      updatedItems.add(widget.todoItem);
      isChecked = false;
    }) ;
  }

  showAlertDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          "Delete Task",
          style: GoogleFonts.jost(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Text(
          "Ye wapas ni aane wala phir mat kahna",
          style: GoogleFonts.jost(
            fontSize: 16,
            color: const Color.fromARGB(255, 147, 149, 211),
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: AddUpdateButton(
                  btnText: "No",
                  onButtonClicked: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AddUpdateButton(
                  btnText: "Yes",
                  onButtonClicked: () {
                    Navigator.pop(context);
                    widget.removeTasks(widget.todoItem);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 8,
        child: RadioListTile(
          value: true,
          groupValue: isChecked,
          onChanged: changeState,
          contentPadding: const EdgeInsets.all(5),
          activeColor: const Color.fromARGB(255, 147, 149, 211),
          title: Text(
            widget.todoItem.taskName,
            style: GoogleFonts.jost(
              color: const Color.fromARGB(255, 147, 149, 211),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            "${formatTimeOfDay(widget.todoItem.startTime)} to ${formatTimeOfDay(widget.todoItem.endTime)}",
            style: GoogleFonts.jost(
              color: const Color.fromARGB(255, 20, 33, 61),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          secondary: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskPage(
                        "UPDATE_PAGE",
                        item: widget.todoItem,
                        addTasks: (TodoItem item) => widget.updateTask(item),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 147, 149, 211),
                ),
              ),
              IconButton(
                onPressed: showAlertDialog,
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 147, 149, 211),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
