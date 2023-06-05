import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.active,
    required this.color,
  });
  final bool active;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: active == false
            ? CircleAvatar(
                backgroundColor: color,
                radius: 40,
              )
            : CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 32,
                ),
              ));
  }
}
