import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Clase DatabaseHelper para manejar la base de datos.
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Constructor privado para implementar Singleton
  DatabaseHelper._internal();

  // Instancia del Singleton
  factory DatabaseHelper() {
    return _instance;
  }

  // Inicialización de la base de datos
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inicializa la base de datos SQLite
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'app_database.db');
    
    // Abrir la base de datos y ejecuta la creación de tablas si es necesario
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Crear tablas en la base de datos
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE acciones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        descripcion TEXT
      )
    ''');
  }

  // CRUD OPERATIONS

  // Insertar una acción
  Future<int> insertAccion(Map<String, dynamic> accion) async {
    Database db = await database;
    return await db.insert('acciones', accion);
  }

  // Obtener todas las acciones
  Future<List<Map<String, dynamic>>> getAcciones() async {
    Database db = await database;
    return await db.query('acciones');
  }
}
