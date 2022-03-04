import 'package:flutter/material.dart';

class ControlledButtonPage extends StatefulWidget {
  const ControlledButtonPage({Key? key}) : super(key: key);

  @override
  State<ControlledButtonPage> createState() => _ControlledButtonPageState();
}

class _ControlledButtonPageState extends State<ControlledButtonPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Size?> sizeAnimation;
  late Animation transformAnimation;
  late Animation alignAnimation;

  void toogle() {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    sizeAnimation = SizeTween(
      begin: const Size(80, 80),
      end: const Size(160, 80),
    ).animate(controller);

    transformAnimation = Tween<double>(begin: 80, end: 0).animate(controller);

    alignAnimation = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
    ).animate(controller);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controlada - Botão Flutuante')),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return GestureDetector(
            onTap: toogle,
            child: Align(
              alignment: alignAnimation.value!,
              child: Container(
                height: sizeAnimation.value?.height,
                width: sizeAnimation.value?.width,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(transformAnimation.value),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
