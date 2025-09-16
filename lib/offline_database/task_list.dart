import 'package:flutter/material.dart';
import 'repository.dart';
import 'add_task.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  TaskRepository taskRepo = TaskRepository();
  List<Map<String, dynamic>> tasks = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  loadTasks() async {
    var taskList = await taskRepo.getAll("tasks");
    setState(() {
      tasks = taskList;
    });
  }

  Color getPriorityColor(String priority, int isCompleted, String date) {
    if (isCompleted == 1) return Colors.grey;

    DateTime today = DateTime.now();
    DateTime dueDate = DateTime.parse(date);

    if (dueDate.isBefore(today)) return Colors.blue; // Overdue task

    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.blue;
      case 'Low':
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    var filteredTasks = tasks.where((task) {
      return task['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
             task['date'].contains(searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Task Manager"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddTaskScreen(taskRepo: taskRepo),
              )).then((_) => loadTasks());
            },
          )
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search by name or date",
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                var task = filteredTasks[index];
                return GestureDetector(
                  onLongPress: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(100, 200, 0, 0),
                      items: [
                        PopupMenuItem(
                          child: Text("Complete Task"),
                          onTap: () async {
                            task['isCompleted'] = 1;
                            await taskRepo.update("tasks", task, task['id']);
                            loadTasks();
                          },
                        ),
                        PopupMenuItem(
                          child: Text("Delete"),
                          onTap: () async {
                            await taskRepo.delete("tasks", task['id']);
                            loadTasks();
                          },
                        ),
                      ],
                    );
                  },
                  child: Card(
                    color: getPriorityColor(
                      task['priority'],
                      task['isCompleted'],
                      task['date'],
                    ),
                    child: ListTile(
                      title: Text(
                        task['name'],
                        style: TextStyle(
                          decoration: task['isCompleted'] == 1
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(
                        "${task['description']} - ${task['date']} ${task['time']}",
                        style: TextStyle(
                          decoration: task['isCompleted'] == 1
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}