import 'package:flutter/material.dart';

class Redirector extends StatelessWidget {
  const Redirector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'This is not functional for now',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Go Back',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
