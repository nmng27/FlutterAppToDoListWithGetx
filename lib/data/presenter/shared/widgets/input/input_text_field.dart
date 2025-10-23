import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget{
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> formatters;
  final TextInputType keyBoard;
  final String? Function(String?) onChanged;

  const InputTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    required this.validator,
    required this.formatters,
    required this.keyBoard,
    required this.onChanged
  });

  @override
  State<StatefulWidget> createState() => _InputTextField();
}

class _InputTextField extends State<InputTextField>{
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            width: 2.0,
            color: const Color.fromARGB(255, 80, 16, 12)
          )
        ),
      ),
      inputFormatters: widget.formatters,
      keyboardType: widget.keyBoard,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}

class InputPasswordTextField extends StatefulWidget{
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> formatters;
  final TextInputType keyBoard;

  const InputPasswordTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    required this.validator,
    required this.formatters,
    required this.keyBoard
  });

  @override
  State<StatefulWidget> createState() => _InputPasswordTextField();
}

class _InputPasswordTextField extends State<InputPasswordTextField>{
  var status = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              status = !status;
            });
          }, 
          icon: IconButton(
            onPressed: (){
              setState(() {
                status = !status;
              });
            }, 
            icon: Icon(
              status == true ?
              Icons.visibility :
              Icons.visibility_off
            )
          )
        ),
        labelText: widget.label,
        hintText: widget.placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            width: 2.0,
            color: const Color.fromARGB(255, 80, 16, 12)
          )
        ),
      ),
      inputFormatters: widget.formatters,
      keyboardType: widget.keyBoard,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: true,
    );
  }
}

