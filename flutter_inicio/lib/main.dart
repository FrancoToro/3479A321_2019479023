import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'pages/my_home_page.dart';
import 'pages/AppData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    // Agregamos el logger
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
