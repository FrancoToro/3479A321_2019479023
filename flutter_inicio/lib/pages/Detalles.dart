import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'auditoria.dart';
import 'Sobre.dart';

class Detalles extends StatelessWidget {
  const Detalles({super.key});

  Future<void> registrarAccion(String nombreAccion) async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'auditoria.db'),
    );

    var accion = InformacionAuditoria(nombreAccion: nombreAccion);

    await db.insert(
      'auditorias', 
      accion.toMap(), 
      conflictAlgorithm: ConflictAlgorithm.replace, 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
      ),
      body: Center(
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    registrarAccion('Acceso a la pantalla Sobre');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Sobre()),
                    );
                  },
                  child: const Text('Sobre'),
                ),
                ElevatedButton(
                  onPressed: () {
                    registrarAccion('Acceso de volver');
                    Navigator.pop(context);
                  },
                  child: const Text('Volver'),
                ),
              ],
            ),
                
      ),
    );
  }
}
