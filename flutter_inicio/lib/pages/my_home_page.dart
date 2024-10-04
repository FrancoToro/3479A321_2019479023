import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  
  // This widget is the root of your application.
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
  State<MyHomePage> createState() {
    print('create state');
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  
   _Example1State() {
    print('constructor, mounted: $mounted');
  }
  

  @override
  void initState() {
    super.initState();
    print('initState, mounted: $mounted');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies, mounted: $mounted');
  }

  @override
  void setState(VoidCallback fn) {
    print('setState');
    super.setState(fn);
  }



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
    //logger de myhomepage
    Logger logger=Logger();
    print('build method');
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

              //Agregar imagen
              SvgPicture.asset(
                'assets/icons/i_1.svg',
                width: 50,
                height: 50,
              ),

            //modificacion al texto
            const Text(
              'Contador Basico',
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
              )
              
            ),


          ],
        ),
      ),
      //Cambio color del centro
      backgroundColor: const Color.fromARGB(255, 0, 204, 255),
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
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget, mounted: $mounted');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate, mounted: $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose, mounted: $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble, mounted: $mounted');
  }

}
