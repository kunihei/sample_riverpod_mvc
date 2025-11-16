import 'package:flutter/material.dart';

class TodoInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback submit;

  const TodoInput({super.key, required this.controller, required this.submit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'やることを入力してください'),
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(onPressed: submit, child: Text('追加')),
      ],
    );
  }
}
