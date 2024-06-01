import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

String numero = "";
String operador = "";
double res_numerico = 0;
String resultado = "";
TextEditingController _controller = TextEditingController(text: "");

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class ContainerGrid extends StatefulWidget {
  const ContainerGrid({super.key});

  @override
  _ContainerGridState createState() => _ContainerGridState();
}

class _ContainerGridState extends State<ContainerGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            readOnly: true,
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.numbers),
              fillColor: Color.fromARGB(255, 255, 255, 255),
              filled: true,
              labelText: "Operación",
              iconColor: Color.fromARGB(255, 162, 227, 231),
              border: OutlineInputBorder(),
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 53, 89, 207),
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
                buildContainer("="), // Eliminar el gesto de cálculo
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
        setState(() {
          if (text == "=") {
            if (operador.isNotEmpty && numero.isNotEmpty) {
              realizarOperacion(double.parse(numero));
              resultado = res_numerico.toString();
              operador = "";
              numero = "";
            }
          } else if (text == "+" || text == "-" || text == "x" || text == "/") {
            if (operador.isNotEmpty && numero.isNotEmpty) {
              realizarOperacion(double.parse(numero));
            } else if (numero.isNotEmpty) {
              res_numerico = double.parse(numero);
            }
            operador = text;
            numero = "";
            resultado += text;
          } else {
            numero += text;
            resultado += text;
          }
          _controller.text = resultado;
        });
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 76, 145, 172),
          shape: BoxShape.circle,
        ),
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

  void realizarOperacion(double num) {
    switch (operador) {
      case "+":
        res_numerico += num;
        break;
      case "-":
        res_numerico -= num;
        break;
      case "/":
        res_numerico /= num;
        break;
      case "x":
        res_numerico *= num;
        break;
    }
  }
}
