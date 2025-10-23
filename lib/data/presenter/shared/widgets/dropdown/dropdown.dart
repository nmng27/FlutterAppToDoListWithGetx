import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;
  final String? Function(String?)? validator;
  final String label;
  final String placeholder;
  final String? value;

  const Dropdown({
    super.key,
    required this.items,
    required this.label,
    required this.placeholder,
    this.validator,
    this.value,
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        value: _selectedValue,
        items: widget.items
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (val) {
          setState(() {
            _selectedValue = val;
          });
        },
        validator: widget.validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              width: 2.0,
              color: Color.fromARGB(255, 80, 16, 12),
            ),
          ),
          labelText: widget.label,
          hintText: widget.placeholder,
        ),
      ),
    );
  }
}
