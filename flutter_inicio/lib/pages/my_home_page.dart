import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'Detalles.dart';
import 'Sobre.dart';
import 'Auditoria.dart';
import 'AppData.dart';
import 'Preferencias.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    final appData = context.watch<AppData>();
    appData.addAction(
        'Acceso a Inicio');
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
  String _userName = 'Usuario'; // Variable para almacenar el nombre del usuario

  // Método para cargar las preferencias
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'Usuario';
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

 @override
  void initState() {
    super.initState();
    _loadPreferences(); // Cargar las preferencias al iniciar la pantalla
  }
  @override
  Widget build(BuildContext context) {
    _loadPreferences();
    Logger logger = Logger();
    logger.d("Building MyHomePage");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Detalles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Detalles(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Sobre(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Auditoría'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Auditoria(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Preferencias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  PreferenceApp(),
                    
                  ),
                ).then((_) {
                    _loadPreferences(); // Recarga las preferencias cuando vuelves de la pantalla Preferencia
                });
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola $_userName',
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
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 204, 255),
    );
  }
}
