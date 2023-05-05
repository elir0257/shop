import 'package:flutter/material.dart';

class InputField extends StatelessWidget{
  const InputField(this.name, {super.key});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.amberAccent,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: name,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}