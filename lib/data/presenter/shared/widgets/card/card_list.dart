import 'package:flutter/material.dart';

class CardList extends StatefulWidget{
  final String title;
  final String subtitle;
  final List<VoidCallback> onPressed;
  const CardList({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed
  });

  @override
  State<StatefulWidget> createState() => _CardList();
}

class _CardList extends State<CardList>{
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 15
          ),
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.normal
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: widget.onPressed[0], icon: Icon(Icons.check_rounded, color: const Color.fromARGB(255, 3, 67, 119),)),
            IconButton(onPressed: widget.onPressed[1], icon: Icon(Icons.edit, color: const Color.fromARGB(255, 5, 97, 8),)),
            IconButton(onPressed: widget.onPressed[2], icon: Icon(Icons.delete, color: const Color.fromARGB(255, 122, 14, 6),))
          ],
        ),
      ),
    );
  }
}