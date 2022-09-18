import 'package:flutter/material.dart';

class CalulatorBtn extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  const CalulatorBtn(
      {Key? key,
      required this.title,
      this.color = const Color(0xffa5a5a5),
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 75,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
