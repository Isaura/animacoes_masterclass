import 'package:flutter/material.dart';
import 'dart:math';

class ControlledExpansionTilePage extends StatefulWidget {
  const ControlledExpansionTilePage({Key? key}) : super(key: key);

  @override
  State<ControlledExpansionTilePage> createState() =>
      _ControlledExpansionTilePageState();
}

class Data {
  final String title;
  final FlutterLogo logo;
  final String text;
  final AnimationController controller;
  final Animation<double?> heightFactorAnimation;
  final Animation<double?> angleAnimation;

  Data({
    required this.title,
    required this.logo,
    required this.text,
    required this.controller,
    required this.heightFactorAnimation,
    required this.angleAnimation,
  });
}

class _ControlledExpansionTilePageState
    extends State<ControlledExpansionTilePage> with TickerProviderStateMixin {
  List<Data> data = [];

  @override
  void initState() {
    super.initState();

    data.addAll(
      List.generate(
        53,
        (index) {
          final animationController = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 300),
          );
          return Data(
            title: 'My expansion tile $index',
            logo: const FlutterLogo(size: 50),
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            controller: animationController,
            heightFactorAnimation: Tween(begin: 0.0, end: 1.0).animate(
              animationController,
            ),
            angleAnimation: Tween(begin: 0.0, end: pi).animate(
              animationController,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (var item in data) {
      item.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Controlada - MyScrollView'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: data[index].controller,
            builder: (context, child) {
              return Column(
                children: [
                  ListTile(
                    leading: Text(data[index].title),
                    trailing: Transform.rotate(
                      angle: data[index].angleAnimation.value!,
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                    onTap: () {
                      setState(() {
                        if (data[index].controller.value == 0) {
                          data[index].controller.forward();
                        } else {
                          data[index].controller.reverse();
                        }
                      });
                    },
                  ),
                  ClipRect(
                    child: Align(
                      heightFactor: data[index].heightFactorAnimation.value,
                      child: Column(children: [
                        data[index].logo,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data[index].text,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
