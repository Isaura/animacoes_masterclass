import 'package:flutter/material.dart';
import 'controlled/controlled_expansion_tile_page.dart';
import 'implicit/implicit_button_page.dart';
import 'implicit/implicit_expansion_tile_page.dart';
import 'controlled/controlled_button_page.dart';
import 'widgets/button_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animações'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImplicitButtonPage()),
                );
              },
              child:
                  const ButtonCustom(textButton: 'Implícita - Botão flutuante'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImplicitExpasionTilePage()),
                );
              },
              child: const ButtonCustom(textButton: 'Implícita - MyScrollView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ControlledButtonPage()),
                );
              },
              child: const ButtonCustom(
                  textButton: 'Controlada - Botão flutuante'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ControlledExpansionTilePage()),
                );
              },
              child:
                  const ButtonCustom(textButton: 'Controlada - MyScrollView'),
            ),
          ],
        ),
      ),
    );
  }
}
