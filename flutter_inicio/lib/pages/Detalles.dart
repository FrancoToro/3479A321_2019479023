import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppData.dart';
import 'Sobre.dart';
import 'Auditoria.dart';

class Detalles extends StatelessWidget {
  const Detalles({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = context.watch<AppData>();
    appData.addAction(
        'Acceso a Inicio');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Contenido Libre en Detalles'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<AppData>().actions.add("Acceso a la pantalla Sobre");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Sobre()),
                    );
                  },
                  child: const Text('Sobre'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Volver'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
