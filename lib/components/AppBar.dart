import 'package:flutter/material.dart';

class FlatAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  const FlatAppBar({
    Key key,
    this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
