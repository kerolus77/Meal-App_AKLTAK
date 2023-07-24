// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color textIcon;
  final Function(BuildContext) select;
  const CircleButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.textIcon,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: () => select(context),
        color: Colors.white,
        textColor: Colors.red[800],
        padding: const EdgeInsets.all(8),
        shape: const CircleBorder(),
        child: Icon(
          icon,
          size: 25,
        ),
      ),
    );
  }
}
