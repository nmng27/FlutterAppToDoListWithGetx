import 'package:flutter/material.dart';

class Button extends StatelessWidget{
  final String label;
  final VoidCallback onPressed;
  const Button({
    super.key,
    required this.label,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(label),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 67, 7, 2)),
        foregroundColor: MaterialStateProperty.all(Colors.white)
      ),
    );
  }
}