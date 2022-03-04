import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  final String textButton;
  const ButtonCustom({
    Key? key,
    required this.textButton,
  }) : super(key: key);

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 40,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10),
      child: Text(
        widget.textButton,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
