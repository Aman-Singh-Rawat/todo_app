import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/model/todo_item.dart';
import 'package:to_do_app/pages/add_update_button.dart';
import 'package:to_do_app/pages/selected_button.dart';
import 'package:to_do_app/pages/task_text.dart';
import 'package:to_do_app/pages/time_widget.dart';
import 'package:to_do_app/util/formatter_date_time.dart';

class TaskPage extends StatefulWidget {
  TaskPage(this.pageTitle, {required this.addTasks, this.item, super.key});

  final String pageTitle;
  final TodoItem? item;
  Function(TodoItem item) addTasks;

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TodoItem todoItem = TodoItem();

  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? currentDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  int priority = 1;
  int category = 1;

  getUserData() {
    todoItem.copyWith(
      taskName: taskController.text,
      date: currentDate,
      startTime: startTime,
      endTime: endTime,
      description: descriptionController.text,
      isDone: false
    );
    print(todoItem);

    print("\nstartTime:: ${formatTimeOfDay(startTime!)}");
    print("endTime:: ${formatTimeOfDay(endTime!)}");
    print("currentDate:: $currentDate");
    print("taskController:: ${taskController.text}");
    print("descriptionController:: ${descriptionController.text}");
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
          color: Colors.white,
        ),
        title: Text(
          widget.pageTitle == "ADD_PAGE" ? "Add Task" : "Edit Task",
          style: GoogleFonts.jost(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskText(taskTextTitle: "Task Name"),
              TextField(
                controller: taskController,
                decoration: InputDecoration(
                  labelText: "Title",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 147, 149, 211),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 147, 149, 211),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: GoogleFonts.jost(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 20, 33, 61),
                ),
              ),
              const SizedBox(height: 20),
              TaskText(taskTextTitle: "Category"),
              SelectedButton(
                catPriority: const ["Education", "Work", "Groceries"],
                onCallback: (selectedIndex) {
                  category = selectedIndex;
                },
              ),
              const SizedBox(height: 20),
              TimeWidget(
                timeText: "Date & Time",
                timeIcon: Icons.calendar_today_outlined,
                onCallBack: (date, time) {
                  currentDate = date;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TimeWidget(
                      timeText: "Start time",
                      timeIcon: Icons.keyboard_arrow_down_outlined,
                      onCallBack: (date, time) {
                        startTime = time;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TimeWidget(
                      timeText: "End time",
                      timeIcon: Icons.keyboard_arrow_down_outlined,
                      onCallBack: (date, time) {
                        endTime = time;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TaskText(taskTextTitle: "Priority"),
              SelectedButton(
                catPriority: const ["Low", "Medium", "High"],
                onCallback: (selectedIndex) {
                  priority = selectedIndex;
                },
              ),
              const SizedBox(height: 20),
              TaskText(taskTextTitle: "Description"),
              TextField(
                controller: descriptionController,
                style: GoogleFonts.jost(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 20, 33, 61),
                ),
                maxLines: 4,
                decoration: InputDecoration(
                  hintText:
                      "You’re like a phone on 1% battery—everyone’s praying you don’t quit because you’re that essential! Keep being awesome!😄",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 147, 149, 211),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color.fromARGB(255, 147, 149, 211),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              widget.pageTitle == "ADD_PAGE"
                  ? SizedBox(
                      width: double.infinity,
                      child: AddUpdateButton(
                        btnText: "Create task",
                        onButtonClicked: () {
                          getUserData();
                          //TODO GET ALL DATA FROM USER AND ADD THEM INTO FUNCTION
                        },
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: AddUpdateButton(
                            btnText: "Update",
                            onButtonClicked: () {},
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AddUpdateButton(
                            btnText: "Cancel",
                            onButtonClicked: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
