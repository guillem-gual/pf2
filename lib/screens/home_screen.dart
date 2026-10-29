import 'package:flutter/material.dart';
import 'package:pf2/screens/personal_screen.dart';
import 'package:pf2/models/persona.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Persona persona = Persona(
    name: 'Guillem Gual',
    email: 'guillemgual@example.com',
    password: 'contraseña123',
    dateOfBirth: DateTime(2006, 12, 26),
  );

  Future<void> _editarPerfil() async {
    final Persona? updatedPersona = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalScreen(persona: persona),
      ),
    );

    if (updatedPersona != null) {
      setState(() {
        persona = updatedPersona;
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevProfile M3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(persona.name), 
                Text(persona.email),
                Text(_formatDate(persona.dateOfBirth)),
                ElevatedButton(
                  onPressed: _editarPerfil,
                  child: const Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
