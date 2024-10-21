import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceApp extends StatefulWidget {
  @override
  _PreferenceAppState createState() => _PreferenceAppState();
}

class _PreferenceAppState extends State<PreferenceApp> {
  String _userName = '';
  int _counter = 0;

  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
      _nameController.text = _userName;
    });
  }

  void _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', _userName);
    prefs.setInt('counter', _counter);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Preferencias guardadas")),
    );
    _incrementCounter();
  }

  void _updateUserName(String newName) 
  {  
    setState(() {
        _userName = newName;
        });
    _savePreferences();
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla de Preferencias"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Nombre de Usuario",
              ),
              onChanged: (value) {
                _userName = value;
              },
            ),
            SizedBox(height: 20),
            Text("Contador: $_counter"),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePreferences,
              child: Text("Guardar Preferencias"),
            ),
          ],
        ),
      ),
    );
  }
}
