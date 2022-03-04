import 'package:flutter/material.dart';

class ImplicitButtonPage extends StatefulWidget {
  const ImplicitButtonPage({Key? key}) : super(key: key);

  @override
  State<ImplicitButtonPage> createState() => _ImplicitButtonPageState();
}

class _ImplicitButtonPageState extends State<ImplicitButtonPage>
    with SingleTickerProviderStateMixin {
  double borderRadius = 160;
  bool isSelected = false;
  final duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implícita - Botão flutuante'),
      ),
      body: AnimatedAlign(
        duration: duration,
        alignment: isSelected ? Alignment.topCenter : Alignment.bottomRight,
        curve: Curves.easeInOut,
        child: GestureDetector(
          onTap: () {
            setState(() {
              borderRadius = isSelected ? 160 : 0;
              isSelected = !isSelected;
            });
          },
          child: AnimatedContainer(
            duration: duration,
            height: 80,
            width: isSelected ? 160 : 80,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
