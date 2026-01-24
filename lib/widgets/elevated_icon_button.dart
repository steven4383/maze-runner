import 'package:flutter/material.dart';

class ElevatedIconButton extends StatelessWidget {
  final Icon icon;
  final String? name;
  final void Function()? onPressed;
  const ElevatedIconButton({super.key, required this.icon, this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: icon,
    );
  }
}
