import 'package:flutter/material.dart';
import 'package:flutter_inicio/utils/DataBaseHelper.dart';

class Auditoria extends StatefulWidget {
  const Auditoria({super.key});

  @override
  _AuditoriaState createState() => _AuditoriaState();
}

class _AuditoriaState extends State<Auditoria> {
  List<InformacionAuditoria> auditorias = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadAuditorias();
  }

  Future<void> _loadAuditorias() async {
    List<Map<String, dynamic>> rawData = await _dbHelper.getAcciones();
    List<InformacionAuditoria> data = rawData.map((item) => InformacionAuditoria.fromMap(item)).toList();
    setState(() {
      auditorias = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: auditorias.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: auditorias.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(auditorias[index].nombre),
                  subtitle: Text(auditorias[index].descripcion),
                );
              },
            ),
    );
  }
}

class InformacionAuditoria {
  int? id;
  String nombre;
  String descripcion;

  InformacionAuditoria({
    this.id,
    required this.nombre,
    required this.descripcion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
    };
  }

  // Convierte un Map a un objeto InformacionAuditoria
  factory InformacionAuditoria.fromMap(Map<String, dynamic> map) {
    return InformacionAuditoria(
      id: map['id'] != null ? map['id'] as int : null, 
      nombre: map['nombre'] ?? '', 
      descripcion: map['descripcion'] ?? '', 
    );
  }
}
