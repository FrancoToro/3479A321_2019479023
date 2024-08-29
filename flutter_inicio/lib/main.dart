import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demostracion de Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 68)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Inicio'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _reduceCounter(){
    setState(() {
      _counter--;
    });
  }
  void _resetCounter(){
    setState(() {
      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador Basico',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      
    persistentFooterButtons: [
        Row(
          // Ordena los iconos en separación

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Reducir contador
            FloatingActionButton(
                onPressed: _reduceCounter,
                child: const Icon(Icons.remove),
                tooltip: 'Menos'),

            // Reiniciar Contador
            FloatingActionButton(
                onPressed: _resetCounter,
                child: const Icon(Icons.restart_alt),
                tooltip: 'Reiniciar'),

            // Aumentar Contador
            FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
                tooltip: 'Más'),
          ],
        )
      ]
    );
  }
}
