import 'package:flutter/material.dart';

class Auditoria extends StatelessWidget {
  const Auditoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: Center(
        child: const Text(
          'Historial de Acciones',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
