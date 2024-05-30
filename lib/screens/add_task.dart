import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:todoey/screens/redirect_screen.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  String? newTaskTitle;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w500),
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              addTaskCallback(newTaskTitle);
              if (newTaskTitle == null) {
                return Navigator.pop(context);
              } else {}
            },
            child: Text(
              'Add',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white;
                }
                return Colors.lightBlueAccent;
              }),
            ),
          )
        ],
      ),
    );
  }
}
