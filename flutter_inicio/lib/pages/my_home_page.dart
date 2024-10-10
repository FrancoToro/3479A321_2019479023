import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'Detalles.dart';
import 'Sobre.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Agregamos el logger
    var logger = Logger();
    logger.d("Logger is working!");

    return MaterialApp(
      title: 'Demostracion de Flutter',
      theme: ThemeData(
        fontFamily: 'PerfectBomber',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 217, 0, 255),
          brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'PerfectBomber',
          ),
        ),
      ),
      home: const MyHomePage(title: 'Inicio'),
      color: const Color.fromARGB(255, 255, 17, 0),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    logger.d("Building MyHomePage");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/i_1.svg',
              width: 50,
              height: 50,
            ),
            const Text(
              'Contador Básico',
              style: TextStyle(
                color: Color.fromARGB(255, 200, 0, 255),
                fontSize: 40,
              ),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 60,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a la nueva ventana
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Detalles()),
                );
              },
              child: const Text('detalles'),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 204, 255),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () => setState(() => _counter--),
              child: const Icon(Icons.remove),
              tooltip: 'Menos',
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () => setState(() => _counter = 0),
              child: const Icon(Icons.restart_alt),
              tooltip: 'Reiniciar',
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () => setState(() => _counter++),
              child: const Icon(Icons.add),
              tooltip: 'Más',
            ),
          ],
        )
      ],
    );
  }
}
