import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

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
        //Aplicacion de Font a todo
            fontFamily: 'PerfectBomber',
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 217, 0, 255),
            brightness: Brightness.dark,
            ),
          textTheme: const TextTheme(
              //aplicacion de font a seccion
              displayLarge: TextStyle(
              fontFamily:  'PerfectBomber',
              ),
          ),
      ),
      home: const MyHomePage(title: 'Inicio'),color: const Color.fromARGB(255, 255, 17, 0)
      
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
  String message = "  ";
  String iconoactual='assets/icons/i_1.svg';

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 5) 
      {
        message = "Derrota";
        iconoactual = 'assets/icons/i_2.svg';
      } else if (_counter == 10)
      {
        message = "Victoria";
        iconoactual = 'assets/icons/i_3.svg';
      }
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
      message = 'assets/icons/i_1.svg';
    });
  }

  @override
  Widget build(BuildContext context) {
    Logger logger=Logger();
    logger.i("Logger is working in MyHomePage!");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
       body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.white.withOpacity(0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Título
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Título',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                 child: SvgPicture.asset(
                  iconoactual,
                  width: 100,
                  height: 100,
                ),
                ),
                // Mensaje de victoria o derrota
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                child:Text(
                '$_counter',
                style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 60,
                    ),
                  ),
                ),
                Row(
                  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Reducir contador
            FloatingActionButton(
                onPressed: _reduceCounter,
                child:  Icon(Icons.remove),
                tooltip: 'Menos'),

            // Reiniciar Contador
            FloatingActionButton(
                onPressed: _resetCounter,
                child:  Icon(Icons.restart_alt),
                tooltip: 'Reiniciar'),

            // Aumentar Contador
            FloatingActionButton(
                onPressed: _incrementCounter,
                child:  Icon(Icons.add),
                tooltip: 'Más'),
          ],
            ),
              ],
            ),
          ),
        ),
      ),
      //Cambio color del centro
      backgroundColor: const Color.fromARGB(255, 0, 204, 255),
    );
    //implemetar juego
  }
}