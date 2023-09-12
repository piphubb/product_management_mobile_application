import 'package:flutter/material.dart';

class CustomListTitle extends StatefulWidget {
  String title;
  String trailing;
  Color? color;
  CustomListTitle({super.key, required this.title, required this.trailing, this.color});

  @override
  State<CustomListTitle> createState() => _CustomListTitleState();
}

class _CustomListTitleState extends State<CustomListTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${widget.title}",
        style: TextStyle(fontSize: 16),
      ),
      trailing: Text(
        "${widget.trailing}",
        style: TextStyle(fontSize: 14,
        color: widget.color == null ? Colors.blueAccent.withOpacity(0.9) : widget.color),
      ),
    );
  }
}
