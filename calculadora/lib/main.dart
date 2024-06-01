import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

String operacion1 = "";
String operacion2 = "";
String resultado = "";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ContainerGrid(),
        ),
      ),
    );
  }
}

class ContainerGrid extends StatelessWidget {
  const ContainerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            onSubmitted: (String str) {
              // Acción a realizar cuando se envía el texto
            },
            autofocus: true,
            maxLength: 8,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.numbers),
              fillColor: Color.fromARGB(255, 255, 255, 255),
              filled: true,
              labelText: "Click",
              iconColor: Color.fromARGB(255, 133, 134, 61),
              border: OutlineInputBorder(),
            ),
            style: const TextStyle(
              color: Colors.red,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: "Arial",
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildColumn([
                buildContainer("1"),
                buildContainer("4"),
                buildContainer("7"),
                buildContainer("."),
              ]),
              buildColumn([
                buildContainer("2"),
                buildContainer("5"),
                buildContainer("8"),
                buildContainer("0"),
              ]),
              buildColumn([
                buildContainer("3"),
                buildContainer("6"),
                buildContainer("9"),
                buildContainer("="),
              ]),
              buildColumn([
                buildContainer("+"),
                buildContainer("-"),
                buildContainer("x"),
                buildContainer("/"),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildColumn(List<Widget> containers) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: containers,
    );
  }

  Widget buildContainer(String text) {
    return GestureDetector(
      onTap: () {
        if (text != "+" || text != "-" || text != "*" || text != "/") {
          operacion1 += text;
        }
      },
      child: Container(
        width: 80,
        height: 80,
        color: Color.fromARGB(255, 76, 145, 172),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
