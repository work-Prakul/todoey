import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
// import 'package:flutter/widgets.dart';
import 'package:todoey/screens/add_task.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final int taskNumber = 10;

  List<Task> tasks = [
    Task(name: 'Buy Something'),
    Task(name: 'Sell Something'),
    Task(name: 'Purchase Something'),
    Task(name: 'Trade Something'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: ((context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen((newTaskTitle) {
                        setState(() {
                          tasks.add(Task(name: newTaskTitle));
                        });
                        Navigator.pop(context);
                      }),
                    ),
                  )),
            );
          },
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                left: 30,
                right: 30,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.list,
                        color: Colors.lightBlueAccent, size: 40),
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: TasksList(tasks),
              ),
            )
          ],
        ),
      ),
    );
  }
}
