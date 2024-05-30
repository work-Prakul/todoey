import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {
  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback});

  final Function(bool?) checkboxCallback;
  final bool isChecked;
  final String? taskTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
