import 'package:flutter/material.dart';

class ImplicitExpasionTilePage extends StatefulWidget {
  const ImplicitExpasionTilePage({Key? key}) : super(key: key);

  @override
  _ImplicitExpasionTilePageState createState() =>
      _ImplicitExpasionTilePageState();
}

class Data {
  final String title;
  final FlutterLogo logo;
  final String text;
  bool isExpanded;

  Data(
      {required this.title,
      required this.logo,
      required this.text,
      required this.isExpanded});
}

class _ImplicitExpasionTilePageState extends State<ImplicitExpasionTilePage> {
  final duration = 300;

  final List<Data> data = List.generate(
      53,
      (index) => Data(
            title: 'My expansion tile $index',
            logo: const FlutterLogo(size: 50),
            text:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            isExpanded: false,
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Implícita - MyScrollView'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Text(data[index].title),
                trailing: AnimatedRotation(
                  turns: data[index].isExpanded ? 0.5 : 0,
                  duration: Duration(milliseconds: duration),
                  child: const Icon(Icons.arrow_drop_down),
                ),
                onTap: () {
                  setState(() {
                    data[index].isExpanded = !data[index].isExpanded;
                  });
                },
              ),
              AnimatedAlign(
                alignment: Alignment.center,
                heightFactor: data[index].isExpanded ? 1 : 0,
                duration: Duration(milliseconds: duration),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: data[index].isExpanded ? 1 : 0,
                  child: Column(children: [
                    data[index].logo,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data[index].text.toString(),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
