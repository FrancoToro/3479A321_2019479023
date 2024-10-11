import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppData.dart';

class Auditoria extends StatelessWidget {
  const Auditoria({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = context.watch<AppData>();
    appData.addAction(
        'Acceso a Auditorio');
    List<String> actions = context.watch<AppData>().actions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: ListView.builder(
        itemCount: actions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(actions[index]),
          );
        },
      ),
    );
  }
}
