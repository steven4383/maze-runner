import 'package:flutter/material.dart';

class PlayerCurrency extends StatelessWidget {
  const PlayerCurrency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Icons.diamond_sharp),
      label: Text("1,000", style: TextStyle(fontWeight: FontWeight.bold)),
      style: OutlinedButton.styleFrom(
        backgroundColor: Color.fromRGBO(254, 243, 199, 1),
    
        side: BorderSide(width: 1.0, color: Color.fromRGBO(176, 147, 30, 1)),
        foregroundColor: Color.fromRGBO(180, 83, 9, 1),
      ),
      onPressed: () {},
    );
  }
}
